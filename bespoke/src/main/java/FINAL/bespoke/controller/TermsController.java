package FINAL.bespoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/terms_view")
public class TermsController {

    @GetMapping("/terms")
    public String showUploadPage() {
        return "terms_view/terms"; 
    }
}
