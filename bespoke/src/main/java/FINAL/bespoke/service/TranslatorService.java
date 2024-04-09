package FINAL.bespoke.service;

import com.deepl.api.TextResult;
import com.deepl.api.Translator;
import jakarta.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TranslatorService {

//  @Resource(name = "Translator")
  @Autowired
  private final Translator translator;

  public String translate(String promptRaw) {
	  try {
	      TextResult result  = translator.translateText(promptRaw, "ko", "en-us");
	      String prompt = result.getText();
	      return prompt;
	  
  	} catch (Exception e) {
          // 변역 중 에러가 발생하면 예외를 처리합니다.
          e.printStackTrace();
          return null;
      }
  }
  
}