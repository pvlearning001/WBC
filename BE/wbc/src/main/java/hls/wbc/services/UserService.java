package hls.wbc.services;

import com.nimbusds.jose.JOSEException;
import hls.wbc.RepositoriesCustom.SPResult;
import hls.wbc.constants.AppContants;
import hls.wbc.dto.requests.*;
import hls.wbc.dto.responses.PagingResponse;
import hls.wbc.dto.responses.UserChangePwResponse;
import hls.wbc.dto.responses.UserResetPwResponse;
import hls.wbc.dto.responses.UserResponse;
import hls.wbc.entities.User;
import hls.wbc.enums.Roles;
import hls.wbc.enums.WordTypes;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.mappers.UserMapper;
import hls.wbc.repositories.JdbcUserRepository;
import hls.wbc.repositories.UserRepository;
import hls.wbc.utilities.AppUtils;
import hls.wbc.utilities.SecuritiesUtils;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class UserService {
    @NonFinal
    @Value("${jwt.signerKey}")
    protected String SIGNER_KEY;

    UserRepository repository;
    JdbcUserRepository jdbcUserRepository;
    UserMapper userMapper;

    private int getIdFromSPResult(SPResult spResult){
        int result = 0;
        Object resultObj = spResult.getOutValue(AppContants.SP_UserSave.paramOutId);
        if (resultObj != null)
            result = (Integer) resultObj;
        return result;
    }


    public UserResponse createUser(UserCreationRequest request){
        log.info("Service: Create User");
        String userRoleId = String.valueOf(Roles.User.getId());
        String pw = SecuritiesUtils.toEncodeBCrypt(request.getPassword());

        SPResult spResult = repository.save(0, 0, request.getUserName(), pw, request.getFirstName(), request.getMiddleName(), request.getLastName(), request.getEmail(), request.getPhone(), userRoleId);

        int userId = getIdFromSPResult(spResult);

        Optional<User> userSave = repository.findById(userId);
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
        User user = repository.findByUserName(name).orElseThrow(
                () -> new AppException(ErrorCode.USER_NOT_EXISTED));
        return userMapper.toResponse(user);
    }

    public UserResponse updateUser(UserUpdateRequest request) throws ParseException, JOSEException {
        int userIdChanged = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);
        SPResult spResult = repository.save(request.getUserId()
                , userIdChanged
                , request.getUserName()
                , null
                , request.getFirstName()
                , request.getMiddleName()
                , request.getLastName()
                , request.getEmail()
                , request.getPhone()
                , request.getRoles());

        int userId = getIdFromSPResult(spResult);

        Optional<User> userSave = repository.findById(userId);
        UserResponse result = UserResponse.builder().build();
        if (userSave.isPresent()){
            result = userMapper.toResponse(userSave.get());
            if (result != null) {
                result.setFirstName(request.getFirstName());
                result.setMiddleName(request.getMiddleName());
                result.setLastName(request.getLastName());
                result.setEmail(request.getEmail());
                result.setPhone(request.getPhone());
            }
        }
        return result;
    }

    public UserChangePwResponse changePwUser(UserChangePwRequest request) {
        var user = repository.findByUserName(request.getUserName())
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED));

        boolean authenticated = SecuritiesUtils.isMatchesBCrypt(request.getPwOld(), user.getPassword());

        if (!authenticated)
            throw new AppException(ErrorCode.WRONG_PW);

        String newPwHash = SecuritiesUtils.toEncodeBCrypt(request.getPwNew());
        user.setResetPw(false);
        user.setPwReset(null);
        user.setPassword(newPwHash);
        user.setTraceUpdate(user.getId(), null);
        repository.save(user);

        return UserChangePwResponse.builder()
                .userName(request.getUserName())
                .message(AppContants.Messages.ChangePwSuccess)
                .build();
    }

    @PreAuthorize(AppContants.SecuritiesValues.HasRoleAdmin)
    public UserResetPwResponse ResetPwAdmin(UserResetPwRequest request) throws ParseException, JOSEException {
        int userIdChanged = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);
        String newPw = AppContants.StringValues.Empty;
        Optional<User> userOption = repository.findById(request.getUserId());
        if (userOption.isPresent()){
            newPw = AppUtils.getRandomWord(AppContants.SecuritiesValues.ResetPwLength, WordTypes.UPPER);
            String newPwHash = SecuritiesUtils.toEncodeBCrypt(newPw);
            User user = userOption.get();
            user.setResetPw(true);
            user.setPwReset(newPw);
            user.setPassword(newPwHash);
            user.setTraceUpdate(userIdChanged, null);
            repository.save(user);
        }
        return UserResetPwResponse.builder()
                .userId(request.getUserId())
                .pwReset(newPw)
                .build();
    }

    @PreAuthorize(AppContants.SecuritiesValues.HasRoleAdmin)
    public void deleteUser(int userId, boolean deleteValue) throws ParseException, JOSEException {
        int userChanged = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);
        repository.setDeleted(userId, userChanged, deleteValue);
    }

    @PreAuthorize(AppContants.SecuritiesValues.HasRoleAdmin)
    public List<UserResponse> getUsers(){
        log.info("In method get Users");
        return repository.findAll().stream()
                .map(userMapper::toResponse).toList();
    }

    @PostAuthorize("returnObject.userName == authentication.name")
    public UserResponse getUser(int id){
        log.info("In method get user by Id");
        return userMapper.toResponse(repository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED)));
    }

    @PreAuthorize(AppContants.SecuritiesValues.HasRoleAdmin)
    public PagingResponse<List<Object>> getUserList(UserListRequest request){
        return repository.getUserList(request.getFindText(), request.getSort(), request.getSortType(), request.getPageIndex());
    }

    //  Testing function
    public List<UserResponse> getUserByRole(int roleId){
        List<UserResponse> result = new ArrayList<>();
        List<User> list = repository.getUserByRole(roleId);
        for(User item:list){
            UserResponse resultItem = userMapper.toResponse(item);
            result.add(resultItem);
        }
        return result;
    }

    //  Testing function
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
        return repository.getUsersRoles(userIdIndex);
    }

    //  Testing function
    public PagingResponse getUserPaging(int pageIndex){

        int totalPage = AppUtils.getTotalPage(repository.getTotalRecord());
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
        List<Object> objList = repository.getAllUserDetailsPaging(PageRequest.of(pageIndex, AppContants.Paging.PageSize, sort));
        return PagingResponse.<Object>builder()
                .pageIndex(pageIndex)
                .pageTotal(totalPage)
                .pageResult(objList)
                .build();

    }
}
