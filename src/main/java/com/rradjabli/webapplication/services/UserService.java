package com.rradjabli.webapplication.services;

import com.rradjabli.webapplication.model.User;
import com.rradjabli.webapplication.model.enums.Roles;
import com.rradjabli.webapplication.repository.UserRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.support.BeanDefinitionDsl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

    private final UserRepo userRepo;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user) {
        String email = user.getEmail();
        if(userRepo.findByEmail(email)!=null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Roles.ROLE_ADMIN);
        log.info("Saving new user with email: {}", email);
        userRepo.save(user);
        return true;
    }

    public List<User> userlist(){
        return userRepo.findAll();
    }

    public void banUser(Long id){
         User user = userRepo.findById(id).orElse(null);
         if(user!=null){
             if(user.isActive()){
                 user.setActive(false);
                 log.info("banned user with id = {};",user.getId());
             }else{
                 user.setActive(true);
                 log.info("Unbanned user with id = {};",user.getId());
             }
             userRepo.save(user);
         }
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Roles.values())
                .map(Roles::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Roles.valueOf(key));
            }
        }
        userRepo.save(user);
    }

}
