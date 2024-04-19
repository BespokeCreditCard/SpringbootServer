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
@Table(name = "flaskCluster")
public class FlaskClusterqweqwe {
    @Id
    private String seq;
    @Column(name = "clusterNum")
    private Integer clusterNum;
    
    @Column(name = "cardIdxs")
    private List<Integer> cardIdxs;
    
    @Column(name = "benefits")
    private List<String> benefits;
}