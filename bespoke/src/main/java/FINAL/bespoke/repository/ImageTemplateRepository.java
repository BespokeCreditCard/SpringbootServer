package FINAL.bespoke.repository;

import java.util.List;
import org.springframework.data.domain.OffsetScrollPosition;
import org.springframework.data.domain.Window;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import FINAL.bespoke.model.entity.ImageTemplate;

@Repository
public interface ImageTemplateRepository extends JpaRepository<ImageTemplate, Integer> {	
	ImageTemplate getOne(Integer id);
	
//	@Query("Select id from team4.cardimage where id = imageId")
	List<ImageTemplate> findByIdIn(List<Integer> imageId);
}