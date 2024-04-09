package FINAL.bespoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UserController {

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
}
