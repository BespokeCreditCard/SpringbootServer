package FINAL.bespoke.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.Entity;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "recommendation")
public class Recommendation {
    @Id
    private String SEQ;

    @Column(name = "cluster_num")
    private Integer clusterNum;

    @Column(name = "card_idx1")
    private Integer cardIdx1;

    @Column(name = "card_idx2")
    private Integer cardIdx2;

    @Column(name = "card_idx3")
    private Integer cardIdx3;

    @Column(name = "card_idx4")
    private Integer cardIdx4;

    @Column(name = "card_idx5")
    private Integer cardIdx5;

    @Column(name = "benefit1", length = 30)
    private String benefit1;

    @Column(name = "benefit2", length = 30)
    private String benefit2;

    @Column(name = "benefit3", length = 30)
    private String benefit3;

    @Column(name = "benefit4", length = 30)
    private String benefit4;

    @Column(name = "benefit5", length = 30)
    private String benefit5;

}