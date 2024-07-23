package hls.wbc.configuration;

import hls.wbc.constants.AppContants;
import hls.wbc.entities.Role;
import hls.wbc.entities.User;
import hls.wbc.entities.UserExt;
import hls.wbc.repositories.RoleRepository;
import hls.wbc.repositories.UserExtRepository;
import hls.wbc.repositories.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Configuration
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class ApplicationInitConfig {
    PasswordEncoder passwordEncoder;

    private void initRoles(RoleRepository roleRepo, String roleName, String remark){
        String roleNameLower = AppContants.StringValues.Empty;
        String roleDesriptions = AppContants.StringValues.Empty;
        if (!roleRepo.existsByName(roleName)){
            roleNameLower = roleName.toLowerCase();
            roleDesriptions = roleName + " Role";
            Role newRole = Role.builder()
                    .name(roleName)
                    .nameLowerCases(roleNameLower)
                    .descriptions(roleDesriptions)
                    .build();
            newRole.setTraceNew(null, remark);

            roleRepo.save(newRole);
        }
    }

    private void initAdminUser(String userName, UserRepository userRepos, RoleRepository roleRepo, UserExtRepository userExtRepos, String remark){

        Optional<User> initUser = userRepos.findByUserName(userName);
        if (initUser.isEmpty()){
            if (userRepos.existsByUserNameDeleted(userName)){
                Optional<User> existUser = userRepos.findByUserNameDeleted(userName);
                if (existUser.isPresent()) {
                    existUser.get().setDeleted(false, AppContants.SecuritiesValues.AdminId, "Revert User");
                    userRepos.save(existUser.get());
                    log.info("admin user has been restored");
                }
            }
            else {
                Set<Role> roleList = roleRepo.findByIsDeleted(false)
                        .stream().collect(Collectors.toSet());
                User user = User.builder()
                        .userName(userName)
                        .password(passwordEncoder.encode("P@ssword1"))
                        .roles(roleList)
                        .build();
                user.setTraceNew(null, remark);
                User saveResult = userRepos.save(user);
                int userId = saveResult.getId();
                UserExt userExt = UserExt.builder()
                        .userId(userId)
                        .fName("WBC")
                        .lName("Admin")
                        .email("admin@wbc.com")
                        .phone01("0903.123456")
                        .build();
                userExt.setTraceNew(null, null);
                userExtRepos.save(userExt);
            }
            log.info("admin user has been created with default password: admin, please change it");
        }
    }

    @Bean
    ApplicationRunner applicationRunner(UserRepository userRepos, RoleRepository roleRepos,  UserExtRepository userExtRepos){
        return args -> {
            initRoles(roleRepos, "User", "Init User Role");
            initRoles(roleRepos, "Admin", "Init Admin Role");
            String userName = "admin";
            initAdminUser(userName, userRepos, roleRepos, userExtRepos, "Init User");
            if (userRepos.existsByUserName("admin")){
                log.info("Admin user is exists");
            }
            /*
            User u = userRepos.customFindMethod(1);
            log.info(u.getUserName());


            List<User> userList = userRepos.queryUserList();

            userList.forEach((u) -> {
                log.info(u.getUserName());
            });

             */

        };
    }
}
