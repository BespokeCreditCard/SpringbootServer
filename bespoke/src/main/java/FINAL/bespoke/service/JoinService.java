package FINAL.bespoke.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import FINAL.bespoke.model.dto.UserDto;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.repository.UserRepository;

@Service
public class JoinService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public JoinService(UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {

        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    public void joinProcess(UserDto userDto) {

        String username = userDto.getName();
        String password = userDto.getPassword();

        Boolean isExist = userRepository.existsByuserID(username);

        if (isExist) {
        	
        	System.out.println(userDto.getName() + "는 이미 사용중인 닉네임입니다.");
            return;
        }


        
        User data = userDto.toEntity();
        System.out.println("JoinService"+data);
        data.setPassword(bCryptPasswordEncoder.encode(password));
        data.setRole("ROLE_UESR");

        userRepository.save(data);
    }
}