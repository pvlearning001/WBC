package hls.wbc.configuration;

import hls.wbc.entities.Role;
import hls.wbc.entities.User;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.repositories.RoleRepository;
import hls.wbc.repositories.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;
import  hls.wbc.enums.*;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Configuration
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class ApplicationInitConfig {
    PasswordEncoder passwordEncoder;


    @Bean
    ApplicationRunner applicationRunner(UserRepository userRepos, RoleRepository roleRepo){
        return args -> {
            if (userRepos.findByUsername("admin").isEmpty()){
                Set<Role> roleList = roleRepo.findAll().stream().collect(Collectors.toSet());


                User user = User.builder()
                        .username("admin")
                        .Password(passwordEncoder.encode("P@ssword1"))
                        .Roles(roleList)
                        .build();

                userRepos.save(user);
                log.warn("admin user has been created with default password: admin, please change it");
            }
        };
    }
}
