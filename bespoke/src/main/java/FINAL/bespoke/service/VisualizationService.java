package FINAL.bespoke.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import FINAL.bespoke.model.entity.Visualization;
import FINAL.bespoke.repository.VisualizationRepository;

@Service
public class VisualizationService {
	private final VisualizationRepository visualizationRepository;

    public VisualizationService(VisualizationRepository visualizationRepository) {
        this.visualizationRepository = visualizationRepository;
    }
    
    public Visualization getVisualization(String seq) {
    	Visualization visual = visualizationRepository.findByseq(seq);
    	return visual; 
    }
}
