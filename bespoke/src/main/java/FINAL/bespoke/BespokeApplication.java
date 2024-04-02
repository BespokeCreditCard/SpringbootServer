package FINAL.bespoke;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BespokeApplication {

	public static void main(String[] args) {
		SpringApplication.run(BespokeApplication.class, args);
		
//		// .env 파일을 로드합니다.
//        Dotenv dotenv = Dotenv.configure().load();
//
//        // DBurl 환경 변수의 값을 가져옵니다.
//        String dbUrl = dotenv.get("DBurl");
	}

}
