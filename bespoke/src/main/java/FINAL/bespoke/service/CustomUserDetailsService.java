package FINAL.bespoke.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import FINAL.bespoke.model.dto.CustomUserDetails;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    public CustomUserDetailsService(UserRepository userRepository) {

        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
				
				//DB에서 조회
    	System.out.println("loadUserByUsername 호출 name= "+userId);
        User userData = userRepository.findByuserID(userId);
        System.out.println("loadUserByUsername 찾은 결과 = "+userData);
        System.out.println("loadUserByUsername 찾은 결과 = "+userData.getName());
        if (userData == null) {
            throw new UsernameNotFoundException("User not found with username: " + userId);
        }
        return new CustomUserDetails(userData);
    }
}