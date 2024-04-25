package FINAL.bespoke.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import FINAL.bespoke.model.entity.Visualization;

@Repository
public interface VisualizationRepository extends JpaRepository<Visualization, Long> {
	List<Visualization> findBySEQ(String seq);
}