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
                Optional<User> existUser = userRepos.findByUserNameDeleted(userName);
                if (existUser.isPresent()) {
                    existUser.get().setDeleted(false, AppContants.SecuritiesValues.AdminId, "Revert User");
                    userRepos.save(existUser.get());
                    log.info("admin user has been restored");
                }
            }
            else {
                Set<Role> roleList = new HashSet<>(roleRepos.findByIsDeleted(false));
                StringJoiner sjRolesId = new StringJoiner(AppContants.StringValues.Comma);
                StringJoiner sjRolesName = new StringJoiner(AppContants.StringValues.Comma);
                if (!CollectionUtils.isEmpty(roleList))
                    roleList.forEach(role -> {
                        sjRolesId.add(Integer.toString(role.getId()));
                        sjRolesName.add(role.getName());
                    });

                User user = User.builder()
                        .guid(java.util.UUID.randomUUID().toString())
                        .userName(userName)
                        .password(passwordEncoder.encode("pw1"))
                        .isResetPw(false)
                        .rolesId(sjRolesId.toString())
                        .rolesName(sjRolesName.toString())
                        .roles(roleList)
                        .build();
                user.setTraceNew(null, "Init User");
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

    private void initUserList(UserRepository userRepos, RoleRepository roleRepos, UserExtRepository userExtRepos){
        Optional<User> firstUser = userRepos.findByUserName("user02");
        if (firstUser.isEmpty()) {
            Set<Role> roleList = new HashSet<>(roleRepos.findByName("User"));

            StringJoiner sjRolesId = new StringJoiner(AppContants.StringValues.Comma);
            StringJoiner sjRolesName = new StringJoiner(AppContants.StringValues.Comma);
            if (!CollectionUtils.isEmpty(roleList))
                roleList.forEach(role -> {
                    sjRolesId.add(Integer.toString(role.getId()));
                    sjRolesName.add(role.getName());
                });
            String rolesId = sjRolesId.toString();
            String rolesName = sjRolesName.toString();

            Optional<Role> userRole = roleList.stream().findFirst();
            int roleId = userRole.map(BaseEntity::getId).orElseGet(Roles.User::getId);
            String roleIdString = String.valueOf(roleId);
            String pw = passwordEncoder.encode("pw1");
            for (int i = 1; i < 255; i++) {
                int maxId = userRepos.customGetMaxId();
                maxId = maxId + 1;
                String nameIndex = ((maxId < 10)
                        ? "0" + String.valueOf(maxId)
                        : String.valueOf(maxId));

                String userName = "user" + nameIndex;
                String sql = "INSERT INTO User(user_name, password, is_reset_pw, roles_id, roles_name) VALUES('" + userName + "', '" + pw + "', 0, '" + rolesId + "', '" + rolesName + "')";
                userRepos.customExecQuery(sql);
                maxId = userRepos.customGetMaxId();
                sql = "INSERT INTO User_Role(user_id, role_id) VALUES(" + String.valueOf(maxId) + ", " + roleIdString + ")";
                userRepos.customExecQuery(sql);

                String lName = "User" + nameIndex;
                String email = userName + "@wbc.com";

                UserExt userExt = UserExt.builder()
                        .userId(maxId)
                        .fName("WBC")
                        .lName(lName)
                        .email(email)
                        .phone01("0903.111111")
                        .build();
                userExt.setTraceNew(null, null);
                userExtRepos.save(userExt);
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
