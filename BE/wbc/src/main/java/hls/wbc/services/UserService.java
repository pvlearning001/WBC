package hls.wbc.services;

import hls.wbc.constants.AppContants;
import hls.wbc.dto.requests.UserCreationRequest;
import hls.wbc.dto.requests.UserListRequest;
import hls.wbc.dto.requests.UserUpdateRequest;
import hls.wbc.dto.responses.PagingResponse;
import hls.wbc.dto.responses.UserResponse;
import hls.wbc.entities.Role;
import hls.wbc.entities.User;
import hls.wbc.entities.UserExt;
import hls.wbc.enums.Roles;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.mappers.UserMapper;
import hls.wbc.repositories.JdbcUserRepository;
import hls.wbc.repositories.RoleRepository;
import hls.wbc.repositories.UserExtRepository;
import hls.wbc.repositories.UserRepository;
import hls.wbc.utilities.AppUtils;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.awt.print.Pageable;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class UserService {
    UserRepository userRepository;
    UserExtRepository userExtRepository;
    RoleRepository roleRepository;

    JdbcUserRepository jdbcUserRepository;

    UserMapper userMapper;
    PasswordEncoder passwordEncoder;


    public UserResponse createUser(UserCreationRequest request){
        log.info("Service: Create User");
        String userRoleId = String.valueOf(Roles.User.getId());
        String pw = passwordEncoder.encode(request.getPassword());

        int userId = userRepository.save(0, 0, request.getUserName(), pw, request.getFirstName(), request.getMiddleName(), request.getLastName(), request.getEmail(), request.getPhone(), userRoleId);
        Optional<User> userSave = userRepository.findById(userId);
        UserResponse result = UserResponse.builder().build();
        if (userSave.isPresent()){
            result = userMapper.toResponse(userSave.get());
            if (result != null) {
                result.setFirstName(request.getFirstName());
                result.setLastName(request.getLastName());
                result.setMiddleName(request.getMiddleName());
                result.setEmail(request.getEmail());
                result.setPhone(request.getPhone());
            }

        }

        return result;
    }

    public UserResponse getMyInfo(){
        var context = SecurityContextHolder.getContext();
        String name = context.getAuthentication().getName();
        User user = userRepository.findByUserName(name).orElseThrow(
                () -> new AppException(ErrorCode.USER_NOT_EXISTED));
        return userMapper.toResponse(user);
    }

    public UserResponse updateUser(int userId, UserUpdateRequest request) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED));
        userMapper.updateUser(user, request);
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        var roles = roleRepository.findAllById(request.getRoles());
        user.setRoles(new HashSet<>(roles));
        return userMapper.toResponse(userRepository.save(user));
    }

    public void deleteUser(int userId){
        userRepository.deleteById(userId);
    }

    @PreAuthorize(AppContants.SecuritiesValues.HasRoleAdmin)
    public List<UserResponse> getUsers(){
        log.info("In method get Users");
        return userRepository.findAll().stream()
                .map(userMapper::toResponse).toList();
    }

    @PostAuthorize("returnObject.userName == authentication.name")
    public UserResponse getUser(int id){
        log.info("In method get user by Id");
        return userMapper.toResponse(userRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED)));
    }

    @PreAuthorize(AppContants.SecuritiesValues.HasRoleAdmin)
    public PagingResponse getUserList(UserListRequest request){
        return userRepository.getUserList(request.getFindText(), request.getSort(), request.getSortType(), request.getPageIndex());
    }

    //  Testing function
    public List<UserResponse> getUserByRole(int roleId){
        List<UserResponse> result = new ArrayList<>();
        List<User> list = userRepository.getUserByRole(roleId);
        for(User item:list){
            UserResponse resultItem = userMapper.toResponse(item);
            result.add(resultItem);
        }
        return result;
    }

    public List<Object> getUsersRoles(int userIdIndex) throws SQLException {
        List<Object> result = new ArrayList<>();
        Map<String, Object> test = jdbcUserRepository.getData(userIdIndex);
        /*
        ArrayList list1 = (ArrayList) test.get("#result-set-1");
        ArrayList list2 =  (ArrayList) test.get("#result-set-2");

        result.add(list1);
        result.add(list2);
        */

        //return result;
        return userRepository.getUsersRoles(userIdIndex);
    }

    //  Testing function
    public PagingResponse getUserPaging(int pageIndex){

        int totalPage = AppUtils.getTotalPage(userRepository.getTotalRecord());
        Sort sort = Sort.by("id").descending();
        /*
        List<UserResponse> resultList = new ArrayList<>();

        Page<User> list = userRepository.getAllDataPaging(PageRequest.of(pageIndex, 5, sort));
        for(User item:list){
            UserResponse resultItem = userMapper.toResponse(item);
            resultList.add(resultItem);
        }

        return PagingResponse.<UserResponse>builder()
                .pageIndex(pageIndex)
                .pageTotal(totalPage)
                .pageResult(resultList)
                .build();
         */
        List<Object> objList = userRepository.getAllUserDetailsPaging(PageRequest.of(pageIndex, AppContants.Paging.PageSize, sort));
        return PagingResponse.<Object>builder()
                .pageIndex(pageIndex)
                .pageTotal(totalPage)
                .pageResult(objList)
                .build();

    }
}
