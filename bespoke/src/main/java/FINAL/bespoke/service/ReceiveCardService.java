package FINAL.bespoke.service;

import org.springframework.stereotype.Service;

import FINAL.bespoke.jwt.JWTUtil;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.repository.UserRepository;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Service
public class ReceiveCardService {
    private final UserRepository userRepository;
    private final JWTUtil jwtUtil;
    
    public ReceiveCardService(UserRepository userRepository, JWTUtil jwtUtil) {
        this.userRepository = userRepository;
        this.jwtUtil = jwtUtil;
    }
    
    private String getCookieValue(HttpServletRequest request, String cookieName) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null; // 쿠키를 찾지 못한 경우
    }
    
	public User findUserId(HttpServletRequest request) {
		String token = getCookieValue(request, "Authorization");
		String userId = jwtUtil.getUserid(token);
        User userData = userRepository.findByuserID(userId); // db에서 userId에 맞는 행을 가져옴
        return userData;
    }
}