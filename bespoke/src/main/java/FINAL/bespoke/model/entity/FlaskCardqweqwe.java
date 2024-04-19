package FINAL.bespoke.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "flaskCard")
public class FlaskCardqweqwe {
	@Id
	private String seq;
    private Integer clusterNum;
    private List<Integer> cardIdxs;
    private List<String> benefits;
}
