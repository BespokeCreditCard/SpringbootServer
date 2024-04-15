package FINAL.bespoke.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.fasterxml.jackson.databind.node.ObjectNode;

import FINAL.bespoke.model.dto.UserDto;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.service.ElasticService;
import FINAL.bespoke.service.JoinService;
import FINAL.bespoke.service.ReceiveCardService;
import co.elastic.clients.elasticsearch.core.GetResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class UserController {
	private final JoinService joinService;
	private final ReceiveCardService receiveCardService;
	private final ElasticService elasticService;
	
    public UserController(JoinService joinService, ReceiveCardService receiveCardService,ElasticService elasticService) {
        this.receiveCardService = receiveCardService;
        this.joinService = joinService;
        this.elasticService = elasticService; 
    }
    
    @GetMapping("index")
    public String goindex() {
    	return "index";
    }
    
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }
    
    @GetMapping("/welcome")
    public String loginSession(HttpServletRequest request) {
    	System.out.println("이거 들어온거야");
        // 쿠키 배열 가져오기
        return "welcome";
    }
    
    @PostMapping("/join")
    public String joinProcess(UserDto userDto) {
    	System.out.println(userDto);
        joinService.joinProcess(userDto);
        System.out.println("join ok");
        return "index";
    }
    
    // 1) 회원가입
 	// 회원가입 빈 화면으로 전달 -> jsp
 	@GetMapping("/join")
 	public String registerForm() {
 		return "join"; 
 	}
 	
 	@GetMapping("/logouts")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
 		System.out.println("들어왓나?");
        // 요청으로부터 받은 쿠키들 중 'Authorization' 쿠키 찾기
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("Authorization")) {
                    cookie.setValue(""); // 쿠키의 값을 비움
                    cookie.setPath("/"); // 쿠키의 경로 설정
                    cookie.setMaxAge(0); // 쿠키의 만료 시간을 0으로 설정하여 즉시 만료되도록 함
                    response.addCookie(cookie); // 응답에 수정된 쿠키 추가
                }
            }
        }
        // 로그아웃 처리 후 리디렉션할 페이지 (예: 로그인 페이지)
        return "index";
//        return "redirect:/index";
//        return "redirect:/login";
    }
 	
 	@GetMapping("/Mypage")
 	public String goMyPage(Model model,HttpServletRequest request) {
 		User user = receiveCardService.findUserId(request);
 		model.addAttribute("userData",user);
 		
 		
 		
 		GetResponse<ObjectNode> response = elasticService.fetchData(user.getCardId());
        
        List<String> productDetails = elasticService.ElasticSearchJsonToTextProduct(response);
        List<String> categoryDetails = elasticService.ElasticSearchJsonToTextCategory(response);
        
        
        model.addAttribute("elasticresultDetail", productDetails);
        model.addAttribute("categoriesResultDetail", categoryDetails);
 		
 		return "MyPage";
 	}
}
