package FINAL.bespoke.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.node.ObjectNode;

import FINAL.bespoke.jwt.JWTUtil;
import FINAL.bespoke.model.dto.DeliveryPasswordDto;
import FINAL.bespoke.model.dto.UserDto;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.repository.UserRepository;
import FINAL.bespoke.service.ElasticService;
import FINAL.bespoke.service.JoinService;
import FINAL.bespoke.service.ReceiveCardService;
import FINAL.bespoke.service.RecommendationService;
import co.elastic.clients.elasticsearch.core.GetResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class UserController {
	private final JoinService joinService;
	private final ReceiveCardService receiveCardService;
	private final ElasticService elasticService;
	private final RecommendationService getUrlService;
    private final JWTUtil jwtUtil;
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public UserController(JoinService joinService, ReceiveCardService receiveCardService,ElasticService elasticService, RecommendationService getUrlService, JWTUtil jwtUtil, UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.receiveCardService = receiveCardService;
        this.joinService = joinService;
        this.elasticService = elasticService; 
        this.getUrlService = getUrlService;
        this.jwtUtil = jwtUtil;
        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
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
    public String joinProcess(UserDto userDto){
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
 	
 	@GetMapping("/mypage")
 	public String goMyPage(Model model,HttpServletRequest request) {
 		// request 에 담긴 jwt 토큰에 userid가 담겨있는데 그것을 가져오는 코드
 		User user = receiveCardService.findUserId(request);
 		model.addAttribute("userData",user);
 		
 		// userid 로 imageUrl 을 가져오는 코드
 		String imageUrl = getUrlService.getImageUrl(user.getUserID());
 		model.addAttribute("imageUrl",imageUrl);
 		
 		//userid 로 elasticservice에 참조하는 코드
 		GetResponse<ObjectNode> response = elasticService.fetchDataElastic(user.getImageTemplate().getId(),"result_bulk");
        
        List<String> productDetails = elasticService.ElasticSearchJsonToTextProduct(response);
        List<String> categoryDetails = elasticService.ElasticSearchJsonToTextCategory(response);
        
        model.addAttribute("elasticresultDetail", productDetails);
        model.addAttribute("categoriesResultDetail", categoryDetails);
 		
 		return "mypage";
 	}
 	
 	
 	@PostMapping("/revise-mypage")
 	public String reviseMypage(@ModelAttribute UserDto dto) {
 		User user = userRepository.findByuserID(dto.getUserID());
 		 // 이름이 null이 아닌 경우에만 업데이트
 	    if (dto.getName() != null) user.setName(dto.getName());
 	    // 비밀번호가 null이 아닌 경우에만 업데이트
 	    if (dto.getPassword() != null) user.setPassword(dto.getPassword());
 	    // 생일이 null이 아닌 경우에만 업데이트
 	    if (dto.getBirthDate() != null) user.setBirthDate(dto.getBirthDate());
 	    // 성별은 char 타입이며 char 타입은 null 값을 가질 수 없습니다. 따라서 '0'이 유효하지 않은 값으로 간주되는 경우에만 체크
 	    if (dto.getGender() != 0) user.setGender(dto.getGender());
 	    // 주소가 null이 아닌 경우에만 업데이트
 	    if (dto.getAddress() != null) user.setAddress(dto.getAddress());
 	    // 등급이 null이 아닌 경우에만 업데이트
 	    if (dto.getGrade() != null) user.setGrade(dto.getGrade());
 	    // 연락처가 null이 아닌 경우에만 업데이트
 	    if (dto.getContact() != null) user.setContact(dto.getContact());
 		userRepository.save(dto.toEntity());
 		return "redirect:/mypage";
 	}
 	
 	
//  페이지 이동시마다 이 쿼리가 계속 돔(개선 필요)
    @GetMapping("/loginCheck")
    @ResponseBody
    public String loginCheck(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        String result = "false";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("Authorization")) {
                    result = "true";
                    String token = receiveCardService.getCookieValue(request, "Authorization");

                    String userId = jwtUtil.getUserid(token);

                    User user = userRepository.findByuserID(userId);

                    if(user.getRole().equals("ROLE_ADMIN")) {

                        result = "admin";

                    }
                }
            }
        }
        return result;
    }
    
    // 현재 로그인된 사람의 seq를 return하는 함수
    @GetMapping("/justGetSeq")
    @ResponseBody
    public String justGetSeq(HttpServletRequest request) {
        User user = receiveCardService.findUserId(request);
        return user.getUserID();
    }
    
    @PostMapping("/update-password")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updatePassword(@RequestBody DeliveryPasswordDto deliveryPasswordDto, HttpServletRequest request) {
    	User user = receiveCardService.findUserId(request);
    	Map<String, Object> response = new HashMap<>();    	
    	if (!user.getPassword().equals(bCryptPasswordEncoder.encode(deliveryPasswordDto.getCurrentPassword()))) {
    		response.put("fail_current", response);
    	}
    	user.setPassword(bCryptPasswordEncoder.encode(deliveryPasswordDto.getNewPassword()));
    	response.put("success", true);
    	return ResponseEntity.ok(response);
    }
}
