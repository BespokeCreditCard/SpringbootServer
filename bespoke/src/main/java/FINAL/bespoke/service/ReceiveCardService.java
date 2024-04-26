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
    
    // request Cookie 에서 String 으로 온 값을 찾는 함수
    public String getCookieValue(HttpServletRequest request, String cookieName) {
        // request 의 모든 쿠키를 가져온다.
    	Cookie[] cookies = request.getCookies();
    	// coockie는 값이 있어야 한다.
        if (cookies != null) {
            for (Cookie cookie : cookies) {
            	// 입력받은 인자 cookieName 이 cookie 의 값과 같다면 cookie를 return
                if (cookieName.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null; // 쿠키를 찾지 못한 경우
    }
    
    //request 를 인자로 받고 token 안에 userid를 return 하는 함수
	public User findUserId(HttpServletRequest request) {
		// cookie 에서 authorization을 찾는 함수를 사용한다.
		String token = getCookieValue(request, "Authorization");
		// token 에서 userId 를 찾는 함수를 사용한다.
		String userId = jwtUtil.getUserid(token);
		// userId로 jap를 통해 userentitiy를 찾아낸다.
        User userData = userRepository.findByuserID(userId); // db에서 userId에 맞는 행을 가져옴
        System.out.println("### ReceiveCardService - userId: " + userId);
        System.out.println("### ReceiveCardService - userData: " + userData);
        return userData;
    }
	
	@Transactional
	public void updateUserAddress(String userId, String savaData, int mode) {
		Optional<User> userTemp =  userRepository.findById(userId);
		if (mode == 1) {
	        if(userTemp.isPresent()) {
	        	User user = userTemp.get();
	        	System.out.println("### ReceiveCardController - user : " + user);
	        	System.out.println("### ReceiveCardController - newAddress : " + savaData);
	        	user.setDeliveryAddress(savaData);
	        	userRepository.save(user);
	        }
        }
		else if (mode == 2) {
	        if(userTemp.isPresent()) {
	        	User user = userTemp.get();
	        	int savaCardId = Integer.parseInt(savaData);
	        	System.out.println("### ReceiveCardController - user : " + user);
	        	System.out.println("### ReceiveCardController - savaCardId : " + savaData);
	        	user.setCardId(savaCardId);
	        	userRepository.save(user);
	        }
		}
		else if (mode == 3) {
        	ImageTemplate imageTemplate = new ImageTemplate();
        	int savaId = Integer.parseInt(userId);
        	System.out.println("### ReceiveCardController - imageTemplate : " + imageTemplate);
        	System.out.println("### ReceiveCardController - savaId : " + savaData);
        	imageTemplate.setId(savaId);
        	imageTemplate.setUrl(savaData);
        	
        	imageTemplateRepository.save(imageTemplate);
		}
    }
}