package FINAL.bespoke.config;

import com.deepl.api.Translator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TranslatorConfig {
	@Value("${deepl.key}")
    private String authKey;
	
	Translator translator;
		
    @Bean
    public Translator getTranslator() {
    	translator = new Translator(authKey);
        return translator;
    }
}
