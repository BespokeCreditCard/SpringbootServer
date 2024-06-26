package FINAL.bespoke.jwt;

import java.io.IOException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;
import FINAL.bespoke.model.dto.CustomUserDetailsDto;
import FINAL.bespoke.model.entity.User;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JWTFilter extends OncePerRequestFilter {

    private final JWTUtil jwtUtil;

    public JWTFilter(JWTUtil jwtUtil) {

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

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
				
    	String token = getCookieValue(request, "Authorization");
				//request에서 Authorization 헤더를 찾음
//        String authorization= request.getHeader("Authorization");
				
				//Authorization 헤더 검증
//        if (authorization == null || !authorization.startsWith("Bearer ")) {
    	if (token == null) {

            System.out.println("token null");
            filterChain.doFilter(request, response);
						
						//조건이 해당되면 메소드 종료 (필수)
            return;
        } 
			

				//Bearer 부분 제거 후 순수 토큰만 획득
//        String token = authorization.split(" ")[1];
			
				//토큰 소멸 시간 검증
        if (jwtUtil.isExpired(token)) {

            System.out.println("token expired");
            filterChain.doFilter(request, response);

						//조건이 해당되면 메소드 종료 (필수)
            return;
        }
        System.out.println("authorization now");
				//토큰에서 username과 role 획득
        String userid = jwtUtil.getUserid(token);
        String role = jwtUtil.getRole(token);
				
				//userEntity를 생성하여 값 set
        User userEntity = new User();
        userEntity.setUserID(userid);
        userEntity.setPassword("temppassword");
        userEntity.setRole(role);
				
				//UserDetails에 회원 정보 객체 담기
        CustomUserDetailsDto customUserDetails = new CustomUserDetailsDto(userEntity);
        
				//스프링 시큐리티 인증 토큰 생성
        Authentication authToken = new UsernamePasswordAuthenticationToken(customUserDetails, null, customUserDetails.getAuthorities());
				//세션에 사용자 등록
        SecurityContextHolder.getContext().setAuthentication(authToken);

        filterChain.doFilter(request, response);
    }
}