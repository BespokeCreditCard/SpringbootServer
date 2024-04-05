package FINAL.bespoke.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import FINAL.bespoke.model.entity.ImageTemplate;
import FINAL.bespoke.repository.ImageTemplateRepository;

@Service
public class ImageTemplateService {
	
   @Autowired
    private ImageTemplateRepository imageTemplateRepository;

    public List<ImageTemplate> getImagesByIds(List<Integer> imageIds) {
        return imageTemplateRepository.findAllById(imageIds);
    }
}
