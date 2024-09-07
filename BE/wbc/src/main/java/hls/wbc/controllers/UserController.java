package hls.wbc.controllers;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jwt.SignedJWT;
import hls.wbc.dto.requests.*;
import hls.wbc.dto.responses.*;
import hls.wbc.services.AuthenticationService;
import hls.wbc.services.UserService;
import hls.wbc.utilities.SecuritiesUtils;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/users")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class UserController {
    @NonFinal
    @Value("${jwt.signerKey}")
    protected String SIGNER_KEY;

    UserService userService;
    AuthenticationService authenticationService;

    @PostMapping
    ApiResponse<UserResponse> createUser(@RequestBody @Valid UserCreationRequest request){
        log.info("Controller: create User");
        return ApiResponse.<UserResponse>builder()
                .result(userService.createUser(request))
                .build();
    }

    @GetMapping
    ApiResponse<List<UserResponse>> getUsers() throws ParseException, JOSEException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String token = SecuritiesUtils.getTokenString();
        SignedJWT signedJWT = authenticationService.verifyToken(token);
        log.info("Username: {}", authentication.getName());
        authentication.getAuthorities().forEach(grantedAuthority -> log.info(grantedAuthority.getAuthority()));

        return ApiResponse.<List<UserResponse>>builder()
                .result(userService.getUsers())
                .build();
    }

    @GetMapping("/{userId}")
    ApiResponse<UserResponse> getUser(@PathVariable("userId") int userId){
        return ApiResponse.<UserResponse>builder()
                .result(userService.getUser(userId))
                .build();
    }

    @GetMapping("/myInfo")
    ApiResponse<UserResponse> getMyInfo(){
        return ApiResponse.<UserResponse>builder()
                .result(userService.getMyInfo())
                .build();
    }

    @PutMapping("/changepw")
    ApiResponse<UserChangePwResponse> changePw(@RequestBody @Valid UserChangePwRequest request) {
        userService.changePwUser(request);
        return ApiResponse.<UserChangePwResponse>builder()
                .build();
    }

    @GetMapping("/admin/list")
    ApiResponse<PagingResponse> getUserList(@RequestBody  @Valid UserListRequest request){
        PagingResponse res = userService.getUserList(request);
        return ApiResponse.<PagingResponse>builder()
                .result(res)
                .build();
    }

    @PutMapping("/admin/delete")
    ApiResponse<String> deleteUser(@RequestBody @Valid DeletingRequest request) throws ParseException, JOSEException {
        userService.deleteUser(request.getId(), request.isDeletedValue());
        return ApiResponse.<String>builder()
                .result("User has been set deleted value")
                .build();
    }

    @PutMapping("/admin/update")
    ApiResponse<UserResponse> updateUser(@RequestBody @Valid UserUpdateRequest request) throws ParseException, JOSEException {
        return ApiResponse.<UserResponse>builder()
                .result(userService.updateUser(request))
                .build();
    }

    @PutMapping("/admin/resetpw")
    ApiResponse<UserResetPwResponse> ResetPwAdmin(@RequestBody @Valid UserResetPwRequest request) throws ParseException, JOSEException {
        return ApiResponse.<UserResetPwResponse>builder()
                .result(userService.ResetPwAdmin(request))
                .build();
    }

    @PostMapping("/test/role")
    ApiResponse<List<UserResponse>> getUserByRole(@RequestBody  @Valid TestUserRoleRequest request){
        List<UserResponse> res = userService.getUserByRole(request.getRoleId());
        return ApiResponse.<List<UserResponse>>builder()
                .result(res)
                .build();
    }

    //  Testing function
    @PostMapping("/test/userrole")
    ApiResponse<List<Object>> getUsersRoles(@RequestBody  @Valid TestUserIdIndexRequest request) throws SQLException {
        List<Object> res = userService.getUsersRoles(request.getUserIdIndex());
        return ApiResponse.<List<Object>>builder()
                .result(res)
                .build();
    }

    //  Testing function
    @PostMapping("/test/userp")
    ApiResponse<PagingResponse> getUserPaging(@RequestBody  @Valid TestUserPagingRequest request){
        PagingResponse res = userService.getUserPaging(request.getPageIndex());
        return ApiResponse.<PagingResponse>builder()
                .result(res)
                .build();
    }
}
