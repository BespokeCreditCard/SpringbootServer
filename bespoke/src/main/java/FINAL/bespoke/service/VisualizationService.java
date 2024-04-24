package FINAL.bespoke.service;

import java.util.List;
import org.springframework.stereotype.Service;
import FINAL.bespoke.model.entity.Visualization;
import FINAL.bespoke.repository.VisualizationRepository;

@Service
public class VisualizationService {
	private final VisualizationRepository visualizationRepository;

    public VisualizationService(VisualizationRepository visualizationRepository) {
        this.visualizationRepository = visualizationRepository;
    }
    
    public List<Visualization> getVisualization(String seq) {
    	List<Visualization> visual = visualizationRepository.findBySEQ(seq);
    	return visual; 
    }
}
