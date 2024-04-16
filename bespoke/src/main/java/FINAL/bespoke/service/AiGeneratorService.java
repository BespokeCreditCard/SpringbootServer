package FINAL.bespoke.service;

//import com.theokanning.openai.image.CreateImageRequest;
import com.theokanning.openai.image.*;
import com.theokanning.openai.model.*;
import com.theokanning.openai.service.OpenAiService;
import jakarta.annotation.Resource;

import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;
import java.util.Arrays;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AiGeneratorService {

    @Resource(name = "getOpenAiService")
    private final OpenAiService openAiService;
    
    // imgStyle을 클래스의 전역변수로 선언
    private String imgStyle = "vivid"; 
    
    // prompt에 따라 img_style을 설정하는 메서드
    private String setImageStyle(String prompt) {
    	// vivid 스타일을 적용할 조건 목록
    	List<String> vividConditions = Arrays.asList("Expressionism", "Surrealism", "Cubism", "Pop Art", "Abstract Art", "Minimalism", "Baroque", "Sketch", "Animation", "Graffiti");
    	// natural 스타일을 적용할 조건 목록
    	List<String> naturalConditions = Arrays.asList("Hyperrealism", "Impressionism", "Renaissance", "Traditional Korean Painting", "Three Kingdoms Period Murals", "Futurism");
    	
    	// vivid 조건 확인
        for (String condition : vividConditions) {
            if (prompt.contains(condition)) {
                this.imgStyle = "vivid";
                return imgStyle;
            }
        }
        // natural 조건 확인
        for (String condition : naturalConditions) {
            if (prompt.contains(condition)) {
                this.imgStyle = "natural";
                return imgStyle;
            }
        }
        // 두 리스트에 다 없으면 default로 vivid return
        return imgStyle;
    }
    
    public String generatePrompt(String prompt) {
    	String imgStyle = setImageStyle(prompt);
    	try {
    		CreateImageRequest createImageRequest = CreateImageRequest.builder()
    				.prompt(prompt)
	        		.model("dall-e-3")
	        		.quality("hd")
                    .style(imgStyle)
//                    .size("1024x1024")
                    .size("1024x1792")
                    .n(1)
                    .responseFormat("url")
	                .responseFormat("b64_json")
                    .build();
    		// url/json 형식으로 return 가능
//	        String url = openAiService.createImage(createImageRequest).getData().get(0).getUrl();
	        String b64 = openAiService.createImage(createImageRequest).getData().get(0).getB64Json();
	        return b64;
    	} catch (Exception e) {
            // 이미지 생성 중 에러가 발생하면 예외를 처리합니다.
            e.printStackTrace();
            return null;
        }
    }
}