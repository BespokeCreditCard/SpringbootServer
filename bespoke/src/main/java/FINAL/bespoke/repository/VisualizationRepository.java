package FINAL.bespoke.repository;

import FINAL.bespoke.model.entity.Visualization;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VisualizationRepository extends JpaRepository<Visualization, Integer> {
	Visualization findBySEQ(String SEQ);
}