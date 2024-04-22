package FINAL.bespoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import FINAL.bespoke.service.UploadService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
@RequestMapping("/upload")
public class UploadController {

    @Autowired
    private UploadService uploadService;
    
	RedirectView redirectView = new RedirectView();   // 선언해주고
    
    @GetMapping("/uploadtest")
    public String showUploadPage() {
        return "upload/uploadtest"; // upload.jsp로 이동!!!!
    }

    @PostMapping("/uploadtest")
    public RedirectView uploadImage(@RequestParam("file") MultipartFile file,
                              @RequestParam("customerName") String customerName) {
        try {
            String imageUrl = uploadService.uploadImage(file, customerName);
            System.out.println("### UploadController - imageUrl: " + imageUrl);
            
//            redirectView.setUrl("https://woori-fisa-bucket.s3.ap-northeast-2.amazonaws.com/upload/8YBQA0UZ1JNAPF1LPQC3.png");   // 이동할 url적어주고
            redirectView.setUrl(imageUrl);   // 이동할 url적어주고
            // 업로드 성공 시 다른 페이지로 리다이렉트 또는 화면에 성공 메시지 표시
//            return "redirect:/imageUrl";
            return redirectView;	
            
        } catch (IOException e) {
            e.printStackTrace();
            redirectView.setUrl("localhost:8080/errors");
            // 업로드 실패 시 에러 페이지로 리다이렉트 또는 에러 메시지 표시
            return redirectView;
        }
    }
}