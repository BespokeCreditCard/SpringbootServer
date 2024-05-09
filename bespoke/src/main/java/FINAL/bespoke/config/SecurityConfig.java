package FINAL.bespoke.config;

import java.io.IOException;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import FINAL.bespoke.jwt.JWTFilter;
import FINAL.bespoke.jwt.JWTUtil;
import FINAL.bespoke.jwt.LoginFilter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	//AuthenticationManager가 인자로 받을 AuthenticationConfiguraion 객체 생성자 주입
	private final AuthenticationConfiguration authenticationConfiguration;
	private final JWTUtil jwtUtil;
	
	public SecurityConfig(AuthenticationConfiguration authenticationConfiguration, JWTUtil jwtUtil) {
	
	    this.authenticationConfiguration = authenticationConfiguration;
	    this.jwtUtil = jwtUtil;
	}
	
	//AuthenticationManager Bean 등록
	@Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {

        return configuration.getAuthenticationManager();
    }

	@Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

				//csrf disable
        http
                .csrf((auth) -> auth.disable());

				//From 로그인 방식 disable
        http
		        .formLogin(formLogin -> formLogin.loginPage("/login")
		                .loginProcessingUrl("/login"));
		                //.defaultSuccessUrl("/welcome.jsp", true));

				//http basic 인증 방식 disable
        http
                .httpBasic((auth) -> auth.disable()); 
        
        http
        		// 기존의 인증/인가 설정
            	.logout(logout -> logout
                .logoutSuccessUrl("/index") // 로그아웃 성공 시 리디렉션할 URL 설정
                .permitAll()); // 모든 사용자가 로그아웃을 할 수 있도록 허용       
				//경로별 인가 작업
        http
                .authorizeHttpRequests((auth) -> auth // HTTP 요청에 대한 인가 설정을 시작하는 부분입니다. auth 람다 함수의 매개변수를 통해 인가 규칙을 설정할 수 있습니다.
                        .requestMatchers("/login", "/", "/join","/login**","/logout", "/WEB-INF/view/**","/js/**","/css/**","/img/**","assets/img/**").permitAll() // "/login", "/" (루트 경로), "/join" 경로에 대한 요청은 인증 없이 모든 사용자에게 허용됩니다. 즉, 이 경로들에 대한 접근을 로그인하지 않은 사용자도 할 수 있습니다.
//						.requestMatchers("/admin").hasRole("user") // "/admin" 경로에 대한 요청은 "ADMIN" 역할을 가진 사용자만 접근할 수 있습니다. 이는 관리자 권한을 가진 사용자만 "/admin" 경로에 접근할 수 있음을 의미합니다.
                        .anyRequest().authenticated()); // authenticated()); // authenticated 위에서 명시하지 않은 모든 다른 요청들은 인증된(로그인한) 사용자만 접근할 수 있습니다. 즉, 로그인하지 않은 사용자는 이 규칙에 의해 제한된 모든 다른 경로에 대해 접근할 수 없습니다.
				//세션 설정
		
        // 예외 처리 추가
//      http
//          .exceptionHandling((exceptions) -> exceptions
//              .authenticationEntryPoint(new AuthenticationEntryPoint() {
//                  @Override
//                  public void commence(HttpServletRequest request, HttpServletResponse response,
//                                       AuthenticationException authException) throws IOException, ServletException {
//                      // 401 에러 설정
//                      response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Access Denied");
//                  }
//              })
//          );
//      
        
        //JWTFilter 등록
        http
            	.addFilterBefore(new JWTFilter(jwtUtil), LoginFilter.class);
        
        //필터 추가 LoginFilter()는 인자를 받음 (AuthenticationManager() 메소드에 authenticationConfiguration 객체를 넣어야 함) 따라서 등록 필요
        http
        		.addFilterAt(new LoginFilter(authenticationManager(authenticationConfiguration), jwtUtil), UsernamePasswordAuthenticationFilter.class);

        
        http
			    // 세션 생성 정책을 STATELESS로 설정. 이 설정은 서버가 사용자 상태를 세션에 저장하지 않음을 의미.
		        // 즉, 서버는 클라이언트의 인증 상태를 유지하지 않으며, 각 요청은 독립적으로 처리됩니다.
		        // 클라이언트는 매 요청마다 필요한 인증 정보를 포함시켜야 하며, 이는 주로 REST API 같이 상태를 유지하지 않는 서비스에서 사용됩니다.
		        // 이 방식은 서버의 리소스를 절약하고 확장성을 높이며, 세션 기반 인증 방식보다 보안성이 높을 수 있습니다.
                .sessionManagement((session) -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS));

        return http.build();
    }
}