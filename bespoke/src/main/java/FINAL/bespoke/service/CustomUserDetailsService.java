package FINAL.bespoke.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import FINAL.bespoke.model.dto.CustomUserDetailsDto;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    /**
     * 클래스 생성자, UserRepository 인스턴스를 주입받아 초기화합니다.
     * 
     * @param userRepository UserRepository 타입, 데이터베이스에서 사용자 정보를 조회하는 데 사용됩니다.
     */
    public CustomUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * 주어진 사용자 ID를 사용하여 데이터베이스에서 사용자 정보를 검색하고, UserDetails 객체를 반환합니다.
     * 
     * @param userId 사용자 ID, String 타입
     * @return UserDetails 인터페이스를 구현한 CustomUserDetailsDto 객체
     * @throws UsernameNotFoundException 사용자를 찾을 수 없을 경우 발생
     */
    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
        // DB에서 사용자 ID를 이용하여 사용자 정보 조회
        System.out.println("loadUserByUsername 호출 name= "+userId);
        User userData = userRepository.findByuserID(userId);
        System.out.println("loadUserByUsername 찾은 결과 = "+userData);
        System.out.println("loadUserByUsername 찾은 결과 = "+userData.getName());
        
        // 조회된 사용자 정보가 없는 경우 예외 발생
        if (userData == null) {
            throw new UsernameNotFoundException("User not found with username: " + userId);
        }
        
        // 조회된 사용자 정보를 이용하여 CustomUserDetailsDto 객체 생성 후 반환
        return new CustomUserDetailsDto(userData);
    }
}
