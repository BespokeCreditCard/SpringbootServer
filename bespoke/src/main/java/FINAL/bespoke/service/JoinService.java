package FINAL.bespoke.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import FINAL.bespoke.model.dto.UserDto;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.repository.UserRepository;

/**
 * 회원 가입 처리를 담당하는 서비스 클래스입니다.
 */
@Service
public class JoinService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    /**
     * JoinService 생성자입니다.
     * 
     * @param userRepository 사용자 정보를 관리하는 저장소 객체, UserRepository 타입
     * @param bCryptPasswordEncoder 비밀번호 암호화를 담당하는 객체, BCryptPasswordEncoder 타입
     */
    public JoinService(UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    /**
     * 사용자의 회원 가입 과정을 처리합니다.
     * 
     * @param userDto 회원 가입을 요청한 사용자의 데이터를 담은 DTO, UserDto 타입
     */
    public void joinProcess(UserDto userDto){

        String userId = userDto.getUserID(); // DTO에서 사용자 ID 추출
        String password = userDto.getPassword(); // DTO에서 사용자 비밀번호 추출

        Boolean isExist = userRepository.existsByuserID(userId); // 사용자 ID의 중복 여부 확인

        if (isExist) {
            System.out.println(userDto.getUserID() + "는 이미 사용중인 ID입니다.");
            return; // 중복된 ID가 있을 경우 함수를 종료
        }
        
        User data = userDto.toEntity(); // DTO를 엔티티 객체로 변환
        System.out.println("JoinService: " + data);
        data.setPassword(bCryptPasswordEncoder.encode(password)); // 비밀번호를 암호화하여 저장
        data.setRole("ROLE_USER"); // 사용자 역할 설정 (기본 역할을 'ROLE_USER'로 설정)
        
        userRepository.save(data); // 변경된 사용자 정보를 저장소에 저장
    }
}
