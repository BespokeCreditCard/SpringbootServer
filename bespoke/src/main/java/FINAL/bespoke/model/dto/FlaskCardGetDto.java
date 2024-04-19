package FINAL.bespoke.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class FlaskCardGetDto {
	private String seq;
	private int cluster_num;
    private List<String> selected_benefits;
    private List<Integer> top5_card_idxs;
}