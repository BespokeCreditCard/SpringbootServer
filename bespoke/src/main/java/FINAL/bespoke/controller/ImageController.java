package FINAL.bespoke.controller;

import FINAL.bespoke.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ImageController {

    @Autowired
    private ImageService imageService;

    @GetMapping("/")
    public String showHomePage(Model model) {
        // 이미지 생성 로직을 통해 ImageDto 객체를 생성합니다.
 //   	ImageDto aiImage;
    	String aiImage = "";
		try {
	        System.out.println("#####################################################################");
	        System.out.println("aiImage before : " + aiImage.getClass().getName());
	        System.out.println("#####################################################################");
			aiImage = imageService.generateImage();
	        System.out.println("#####################################################################");
	        System.out.println("aiImage after : " + aiImage.getClass().getName());
	        System.out.println("aiImage : " + aiImage);
	        System.out.println("#####################################################################");
			// 모델에 ImageDto 객체를 추가합니다.
			model.addAttribute("aiImage", aiImage);
        
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 뷰를 반환합니다.
		return "index";
    }
}
