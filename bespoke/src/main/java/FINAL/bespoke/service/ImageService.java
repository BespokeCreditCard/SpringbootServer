package FINAL.bespoke.service;

import FINAL.bespoke.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageService {
    @Autowired
    private ImageRepository imageRepository;
    
    public ImageService(ImageRepository imageRepository) {
    	this.imageRepository = imageRepository;
    }
    public String generateImage() {
    	// DB에서 이름을받아서 Return URL
        // 이미지 생성 로직 작성
        String imageUrl_1 = "https://github.com/JunGyuRyu/BespokeCreditCard/assets/88473185/bd7b545b-b26b-48a5-a087-99c712dda0d5";
        System.out.println("#####################################################################");
        System.out.println(imageUrl_1.getClass().getName());
        System.out.println(imageUrl_1);
        System.out.println("#####################################################################");
        return imageUrl_1;
    }
}
