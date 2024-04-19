package FINAL.bespoke.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FlaskCardSendDto {
    private String seq;
    private List<String> selected_benefits;
    private Integer cluster_num;
}