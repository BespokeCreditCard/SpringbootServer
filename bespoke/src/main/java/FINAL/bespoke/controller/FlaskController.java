package FINAL.bespoke.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import FINAL.bespoke.model.dto.FlaskClusterSendDto;
import FINAL.bespoke.model.dto.FlaskCardSendDto;
import FINAL.bespoke.service.FlaskService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@Tag(name = "Flask 관련 컨트롤러", description = "Flask 관련 기능 컨트롤러")
public class FlaskController {
	
    private final FlaskService flaskService;

    @PostMapping(value = "/flask/getCluster", consumes = "application/json")
    @ResponseBody
	public Map<String, Object> getClusterFlask(@RequestBody FlaskClusterSendDto request) throws JsonProcessingException {
    	Object jsonResponse = flaskService.sendClusterFlask(request.getSeq());
        Map<String, Object> result = new HashMap<>();
        result.put("jsonResponse", jsonResponse);
        return result;
    }
    
    
    @PostMapping(value = "/flask/getTop5Cards", consumes = "application/json")
    @ResponseBody
	public Map<String, Object> getCardFlask(@RequestBody FlaskCardSendDto request) throws JsonProcessingException {
    	Object jsonResponse = flaskService.sendCardFlask(request.getSeq(), request.getSelected_benefits(), request.getCluster_num());
        Map<String, Object> result = new HashMap<>();
        result.put("jsonResponse", jsonResponse);
        result.put("redirectURL", "http://localhost:8080/flask/getTop5Cards");
        return result;
    }
    
    @GetMapping("/flask/getCluster")
    public String getClusterPage() {
    	return "flask_view/getCluster";
    }
    
    @GetMapping("/flask/getTop5Cards")
    public String getCardPage() {
        return "flask_view/getTop5Cards";
    }
 
}