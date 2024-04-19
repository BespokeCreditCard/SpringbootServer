package FINAL.bespoke.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class FlaskClusterGetDto {
    private String seq;
    private Integer cluster_num;
    private List<Integer> card_idxs;
    private List<String> benefits;
}