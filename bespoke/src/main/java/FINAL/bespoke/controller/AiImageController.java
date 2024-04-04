package FINAL.bespoke.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import FINAL.bespoke.service.AiImageService;

@Controller
public class AiImageController {

    private final AiImageService aiImageService;

    @Autowired
    public AiImageController(AiImageService aiImageService) {
        this.aiImageService = aiImageService;
    }

    @PostMapping("/image")
    public ModelAndView generateImage(@RequestBody String prompt) {
        // 이미지 생성
        String b64ImageData = aiImageService.generatePicture(prompt);
//        String b64ImageData = "qweqwe";
        // ModelAndView를 사용하여 aiimage_view.jsp 페이지로 이미지 데이터를 전달
        ModelAndView modelAndView = new ModelAndView("aiimage/aiimage_view");
        modelAndView.addObject("b64ImageData", b64ImageData);
//        modelAndView.addObject("abc", "abc");

        return modelAndView;
    }
    
    // localhost에서 "/image" 엔드포인트로 GET 요청이 오면 aiimage_view.jsp 페이지로 이동
    @GetMapping("/image")
    public String getImagePage() {
        return "aiimage/aiimage_view";
    }
    
}