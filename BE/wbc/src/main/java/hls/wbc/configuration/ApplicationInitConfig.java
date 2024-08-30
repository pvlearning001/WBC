package hls.wbc.configuration;

import hls.wbc.constants.AppContants;
import hls.wbc.entities.*;
import hls.wbc.enums.Roles;
import hls.wbc.repositories.CategoryRepository;
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
import org.springframework.util.CollectionUtils;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.StringJoiner;
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

    private void initAdminUser(String userName, UserRepository userRepos, RoleRepository roleRepos, UserExtRepository userExtRepos){
        Optional<User> initUser = userRepos.findByUserName(userName);
        if (initUser.isEmpty()){
            if (userRepos.existsByUserNameDeleted(userName)){
                userRepos.setDeleted(AppContants.SecuritiesValues.AdminId, AppContants.SecuritiesValues.AdminId, false);
            }
            else {
                userRepos.save(0, AppContants.SecuritiesValues.AdminId, userName, passwordEncoder.encode("pw1"), "WBC", null, "Admin", "admin@wbc.com", "0903.123456", "1,2");
            }
            log.info("admin user has been created with default password: admin, please change it");
        }
    }

    private void initUserList(UserRepository userRepos, RoleRepository roleRepos, UserExtRepository userExtRepos){
        Optional<User> firstUser = userRepos.findByUserName("user002");
        if (firstUser.isEmpty()) {
            String uNamePrefix = "user";
            String uName = "";
            String pw = passwordEncoder.encode("pw1");
            String fName = "WBC";
            String lNamePrefix = "User";
            String lName = "";
            String emailPostfix = "@wbc.com";
            String email = "";
            String phone = "0903.111111";
            String rolesId = "1";
            String index = "";
            for (int i = 2; i < 256; i++) {
                index =
                        (i < 10)
                        ? "00" + String.valueOf(i)
                        :   (
                                (i < 99)
                                ? "0" + String.valueOf(i)
                                : String.valueOf(i)
                            );

                uName = uNamePrefix + index;
                lName = lNamePrefix + index;
                email = uName + emailPostfix;
                userRepos.save(0, 0, uName, pw, fName, null, lName, email, phone, rolesId);
            }
            log.info("init user list");
        }
        else{
            log.info("user list exists");
        }
    }

    private void initCategory(CategoryRepository cateRepos, String cateName){
        if (!cateRepos.existsByName(cateName)){
            Category entity = Category.builder()
                    .name(cateName)
                    .build();
            entity.setTraceNew(AppContants.SecuritiesValues.AdminId, null);
            cateRepos.save(entity);
        }
        log.info("new category created");
    }

    @Bean
    ApplicationRunner applicationRunner(UserRepository userRepos, RoleRepository roleRepos,  UserExtRepository userExtRepos, CategoryRepository cateRepos){
        return args -> {
            initCategory(cateRepos, AppContants.Categories.Announcement);
            initRoles(roleRepos, "User", "Init User Role");
            initRoles(roleRepos, "Admin", "Init Admin Role");
            String userName = "admin";
            initAdminUser(userName, userRepos, roleRepos, userExtRepos);
            if (userRepos.existsByUserName("admin")){
                log.info("Admin user is exists");
            }

            initUserList(userRepos, roleRepos, userExtRepos);
        };
    }
}
