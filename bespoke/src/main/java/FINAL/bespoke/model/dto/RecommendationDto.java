package FINAL.bespoke.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecommendationDto {
    private int Top1;
    private int Top2;
    private int Top3;
    private int Top4;
    private int Top5;

}
