package FINAL.bespoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import FINAL.bespoke.model.dto.UserDto;
import FINAL.bespoke.service.JoinService;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UserController {
	private final JoinService joinService;

    public UserController(JoinService joinService) {
        
        this.joinService = joinService;
    }
    
    @GetMapping("/lo")
    public String loginPage() {
        return "logins";
    }
    
    @GetMapping("/welcome")
    public String loginSession(HttpServletRequest request) {
    	System.out.println("이거 들어온거야");
        // 쿠키 배열 가져오기
        return "welcome";
    }
    
    @PostMapping("/join")
    public String joinProcess(UserDto userDto) {
        joinService.joinProcess(userDto);
        System.out.println("join ok");
        return "ok";
    }
}
