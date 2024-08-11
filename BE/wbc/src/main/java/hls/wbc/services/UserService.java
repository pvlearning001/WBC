package hls.wbc.services;

import hls.wbc.constants.AppContants;
import hls.wbc.dto.requests.UserCreationRequest;
import hls.wbc.dto.requests.UserUpdateRequest;
import hls.wbc.dto.responses.UserResponse;
import hls.wbc.entities.Role;
import hls.wbc.entities.User;
import hls.wbc.entities.UserExt;
import hls.wbc.enums.Roles;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.mappers.UserMapper;
import hls.wbc.repositories.RoleRepository;
import hls.wbc.repositories.UserExtRepository;
import hls.wbc.repositories.UserRepository;
import hls.wbc.utilities.AppUtils;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
    UserMapper userMapper;
    PasswordEncoder passwordEncoder;

    public UserResponse createUser(UserCreationRequest request){
        log.info("Service: Create User");
        if (userRepository.existsByUserName(request.getUserName()))
            throw new AppException(ErrorCode.USER_EXISTED);
        User user = userMapper.toUser(request);
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setTraceNew(AppContants.SecuritiesValues.AdminId, null);

        Set<Integer> roleIdListInit = new HashSet<Integer>(Arrays.asList(AppContants.SecuritiesValues.UserRoleId));

        Set<Role> roleListInit = roleRepository.findAllById(roleIdListInit)
                .stream().collect(Collectors.toSet());
        user.setRoles(roleListInit);
        User userSave = userRepository.save(user);

        userSave.updateTraceUserAddNew(userSave.getId(), null);
        userRepository.save(user);
        UserResponse result = userMapper.toUserResponse(userSave);

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
        return userMapper.toUserResponse(user);
    }

    public UserResponse updateUser(int userId, UserUpdateRequest request) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED));
        userMapper.updateUser(user, request);
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        var roles = roleRepository.findAllById(request.getRoles());
        user.setRoles(new HashSet<>(roles));
        return userMapper.toUserResponse(userRepository.save(user));
    }

    public void deleteUser(int userId){
        userRepository.deleteById(userId);
    }

    @PreAuthorize(AppContants.SecuritiesValues.HasRoleAdmin)
    public List<UserResponse> getUsers(){
        log.info("In method get Users");
        return userRepository.findAll().stream()
                .map(userMapper::toUserResponse).toList();
    }

    @PostAuthorize("returnObject.userName == authentication.name")
    public UserResponse getUser(int id){
        log.info("In method get user by Id");
        return userMapper.toUserResponse(userRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED)));
    }
}
