package FINAL.bespoke.service;

import java.util.Optional;

import org.springframework.stereotype.Service;
import FINAL.bespoke.jwt.JWTUtil;
import FINAL.bespoke.model.dto.ImageTemplateDto;
import FINAL.bespoke.model.entity.ImageTemplate;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.repository.ImageTemplateRepository;
import FINAL.bespoke.repository.UserRepository;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;

@Service
public class ReceiveCardService {
	
    private final UserRepository userRepository;
    private final JWTUtil jwtUtil;
    private final ImageTemplateRepository imageTemplateRepository;
    
    public ReceiveCardService(UserRepository userRepository, JWTUtil jwtUtil, ImageTemplateRepository imageTemplateRepository) {
        this.userRepository = userRepository;
        this.jwtUtil = jwtUtil;
        this.imageTemplateRepository = imageTemplateRepository;
    }
    
    /**
     * HttpServletRequest에서 특정 쿠키 이름에 해당하는 값을 찾아 반환합니다.
     * 
     * @param request 클라이언트로부터 받은 HttpServletRequest
     * @param cookieName 찾고자 하는 쿠키의 이름
     * @return 해당 쿠키의 값, 존재하지 않으면 null 반환
     */
    public String getCookieValue(HttpServletRequest request, String cookieName) {
    	Cookie[] cookies = request.getCookies(); // 모든 쿠키를 배열로 가져온다.
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    return cookie.getValue(); // 해당 이름의 쿠키를 찾으면 그 값을 반환
                }
            }
        }
        return null; // 해당 이름의 쿠키를 찾지 못하면 null을 반환
    }
    
    /**
     * HttpServletRequest에서 토큰을 추출하여 해당 토큰의 사용자 ID로 사용자 정보를 조회합니다.
     * 
     * @param request 클라이언트로부터 받은 HttpServletRequest
     * @return 찾아낸 사용자의 정보, 사용자를 찾지 못하면 null 반환
     */
    public User findUserId(HttpServletRequest request) {
		String token = getCookieValue(request, "Authorization"); // 쿠키에서 "Authorization" 이름의 토큰을 가져온다.
		String userId = jwtUtil.getUserid(token); // 토큰에서 사용자 ID를 추출한다.
        User userData = userRepository.findByuserID(userId); // 추출된 ID로 데이터베이스에서 사용자 정보를 조회한다.
        System.out.println("### ReceiveCardService - userId: " + userId);
        System.out.println("### ReceiveCardService - userData: " + userData);
        return userData;
    }
	
	/**
	 * 사용자의 정보를 업데이트하는 함수입니다. 모드에 따라 주소 업데이트, 이미지 템플릿 설정, 새 이미지 템플릿 저장이 수행됩니다.
	 * 
	 * @param userId 사용자 ID
	 * @param saveData 저장할 데이터
	 * @param mode 작업 모드 (1: 주소 업데이트, 2: 이미지 템플릿 설정, 3: 새 이미지 템플릿 저장)
	 */
	@Transactional
	public void updateUserAddress(String userId, String saveData, int mode) {
		Optional<User> userTemp = userRepository.findById(userId); // 주어진 ID로 사용자 조회
		if (mode == 1 && userTemp.isPresent()) {
			User user = userTemp.get();
			System.out.println("### ReceiveCardController - user : " + user);
			System.out.println("### ReceiveCardController - newAddress : " + saveData);
			user.setDeliveryAddress(saveData); // 사용자의 배송 주소를 업데이트
			userRepository.save(user); // 변경된 정보 저장
		}
		else if (mode == 2 && userTemp.isPresent()) {
			User user = userTemp.get();
			int saveCardId = Integer.parseInt(saveData);
			System.out.println("### ReceiveCardController - user : " + user);
			System.out.println("### ReceiveCardController - saveCardId : " + saveData);
			user.setImageTemplate(imageTemplateRepository.getOne(saveCardId)); // 사용자의 이미지 템플릿 설정
			userRepository.save(user); // 변경된 정보 저장
		}
		else if (mode == 3) {
			ImageTemplate imageTemplate = new ImageTemplate();
			int saveId = Integer.parseInt(userId);
			System.out.println("### ReceiveCardController - imageTemplate : " + imageTemplate);
			System.out.println("### ReceiveCardController - saveId : " + saveData);
			imageTemplate.setId(saveId);
			imageTemplate.setUrl(saveData);
			imageTemplateRepository.save(imageTemplate); // 새 이미지 템플릿 저장
		}
    }
}
