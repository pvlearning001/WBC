package hls.wbc.configuration;

import hls.wbc.constants.AppContants;
import hls.wbc.entities.Role;
import hls.wbc.entities.User;
import hls.wbc.repositories.RoleRepository;
import hls.wbc.repositories.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Set;
import java.util.stream.Collectors;

@Configuration
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class ApplicationInitConfig {
    PasswordEncoder passwordEncoder;

    private void createNewRole(RoleRepository roleRepo, String roleName, String remark){
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

    @Bean
    ApplicationRunner applicationRunner(UserRepository userRepos, RoleRepository roleRepo){
        return args -> {
            createNewRole(roleRepo, "User", "Init User Role");
            createNewRole(roleRepo, "Admin", "Init Admin Role");

            if (userRepos.findByUserName("admin").isEmpty()){
                Set<Role> roleList = roleRepo.findByIsDeleted(false)
                        .stream().collect(Collectors.toSet());
                User user = User.builder()
                        .userName("admin")
                        .password(passwordEncoder.encode("P@ssword1"))
                        .roles(roleList)
                        .build();
                user.setTraceNew(null, "Init User");
                userRepos.save(user);
                log.warn("admin user has been created with default password: admin, please change it");
            }

            if (userRepos.existsByUserName("admin")){
                log.info("Admin user is exists");
            }
        };
    }
}
