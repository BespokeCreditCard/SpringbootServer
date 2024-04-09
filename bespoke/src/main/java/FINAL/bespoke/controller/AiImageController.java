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
import FINAL.bespoke.service.TranslatorService;
@Controller
public class AiImageController {

    private final AiImageService aiImageService;
    private final TranslatorService translatorService;

    @Autowired
    public AiImageController(AiImageService aiImageService, TranslatorService translatorService) {
        this.aiImageService = aiImageService;
        this.translatorService = translatorService; 
    }

    @PostMapping("/image")
    public ModelAndView generateImage(@RequestBody String promptRaw) {
    	
    	// 입력받은 한글 영어 프롬프트로 번역
    	String prompt = translatorService.translate(promptRaw);
    	System.out.println("##########");
    	System.out.println(prompt);
    	System.out.println("##########");
    	
    	// 이미지 생성
    	int attempt = 1;
    	String b64ImageData1 = null;
    	String b64ImageData2 = null;
    	
    	while(true) {
    		try {
    			b64ImageData1 = aiImageService.generatePicture(prompt);
    			b64ImageData2 = aiImageService.generatePicture(prompt);
    			if ((b64ImageData1 != null) && (b64ImageData2 != null)) {
    				break;
    			} else {
    				System.out.println("시도 횟수: " + attempt + " | generatePicture 메소드가 null을 반환했습니다.");
    			}
    		} catch (Exception e) {
    			System.out.println("시도 횟수: " + attempt + " | generatePicture 메소드 실행 중 예외가 발생했습니다. - " + e.getMessage());    				
    		}
    		attempt++;
    	}
                
        // ModelAndView를 사용하여 aiimage_view.jsp 페이지로 이미지 데이터를 전달
        ModelAndView modelAndView = new ModelAndView("aiimage/aiimage_view");
        modelAndView.addObject("b64ImageData1", b64ImageData1);
        modelAndView.addObject("b64ImageData2", b64ImageData2);

        return modelAndView;
    }
    
    // localhost에서 "/image" 엔드포인트로 GET 요청이 오면 aiimage_view.jsp 페이지로 이동
    @GetMapping("/image")
    public String getImagePage() {
        return "aiimage/aiimage_view";
    }
    
}