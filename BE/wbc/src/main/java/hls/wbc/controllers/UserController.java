package hls.wbc.controllers;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jwt.SignedJWT;
import hls.wbc.dto.requests.*;
import hls.wbc.dto.responses.ApiResponse;
import hls.wbc.dto.responses.PagingResponse;
import hls.wbc.dto.responses.UserResponse;
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
        String token = SecuritiesUtils.getToken();
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

    @DeleteMapping("/{userId}")
    ApiResponse<String> deleteUser(@PathVariable int userId){
        userService.deleteUser(userId);
        return ApiResponse.<String>builder()
                .result("User has been deleted")
                .build();
    }

    @PutMapping("/{userId}")
    ApiResponse<UserResponse> updateUser(@PathVariable int userId, @RequestBody UserUpdateRequest request){
        return ApiResponse.<UserResponse>builder()
                .result(userService.updateUser(userId, request))
                .build();
    }

    @PostMapping("/list")
    ApiResponse<PagingResponse> getUserList(@RequestBody  @Valid UserListRequest request){
        PagingResponse res = userService.getUserList(request);
        return ApiResponse.<PagingResponse>builder()
                .result(res)
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
