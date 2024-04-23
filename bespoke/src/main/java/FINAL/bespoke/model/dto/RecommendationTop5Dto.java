package FINAL.bespoke.model.dto;

import java.util.List;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecommendationTop5Dto {
	private List<Integer> imageList;
    private List<String> benefitList;
}
