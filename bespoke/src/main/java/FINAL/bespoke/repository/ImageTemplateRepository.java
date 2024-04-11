package FINAL.bespoke.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import FINAL.bespoke.model.entity.ImageTemplate;

public interface ImageTemplateRepository extends JpaRepository<ImageTemplate, Integer> {	
	ImageTemplate getOne(Integer id);
}