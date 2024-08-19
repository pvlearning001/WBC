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

        Set<Integer> roleIdListInit = new HashSet<Integer>(List.of(Roles.User.getId()));
        Set<Role> roleListInit = new HashSet<>(roleRepository.findAllById(roleIdListInit));

        StringJoiner sjRolesId = new StringJoiner(AppContants.StringValues.Comma);
        StringJoiner sjRolesName = new StringJoiner(AppContants.StringValues.Comma);
        if (!CollectionUtils.isEmpty(roleListInit))
            roleListInit.forEach(role -> {
                sjRolesId.add(Integer.toString(role.getId()));
                sjRolesName.add(role.getName());
            });

        if (userRepository.existsByUserName(request.getUserName()))
            throw new AppException(ErrorCode.USER_EXISTED);
        User user = userMapper.toEntity(request);
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setResetPw(false);
        user.setRolesId(sjRolesId.toString());
        user.setRolesName(sjRolesName.toString());
        user.setTraceNew(AppContants.SecuritiesValues.AdminId, null);

        user.setRoles(roleListInit);
        User userSave = userRepository.save(user);

        userSave.updateTraceUserAddNew(userSave.getId(), null);
        userRepository.save(user);
        UserResponse result = userMapper.toResponse(userSave);

        if (!AppUtils.isNullOrEmptyOrBlank(request.getFirstName())
                || !AppUtils.isNullOrEmptyOrBlank(request.getMiddleName())
                || !AppUtils.isNullOrEmptyOrBlank(request.getLastName())
                || !AppUtils.isNullOrEmptyOrBlank(request.getEmail())
                || !AppUtils.isNullOrEmptyOrBlank(request.getPhone())
        ){
            UserExt userExt = UserExt
                    .builder()
                    .userId(userSave.getId())
                    .fName(request.getFirstName())
                    .mName(request.getMiddleName())
                    .lName(request.getLastName())
                    .email(request.getEmail())
                    .phone01(request.getPhone())
                    .build();
            userExt.setTraceNew(AppContants.SecuritiesValues.AdminId, null);

            UserExt userExtSave = userExtRepository.save(userExt);
            userExtSave.updateTraceUserAddNew(userSave.getId(), null);
            userExtSave = userExtRepository.save(userExt);
            result.setFirstName(userExtSave.getFName());
            result.setLastName(userExtSave.getLName());
            result.setMiddleName(userExtSave.getMName());
            result.setEmail(userExtSave.getEmail());
            result.setPhone(userExtSave.getPhone01());
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
        return userRepository.getUserList(request.getFindText(), request.getPageIndex());
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
