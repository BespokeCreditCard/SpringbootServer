package FINAL.bespoke.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionController implements ErrorController {

    @RequestMapping("/error")
    public String handleError() {
        // 오류 페이지로 이동할 로직을 작성합니다.
        return "errors"; // 오류 페이지의 뷰 이름을 반환합니다.
    }
}