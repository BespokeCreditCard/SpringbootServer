package FINAL.bespoke.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "recommendation")
public class Recommendation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SEQ", referencedColumnName = "userID", foreignKey = @ForeignKey(name = "FK_SEQ"))
    private User user;

    @Column(name = "cluster_num")
    private Integer clusterNum;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "card_idx1", referencedColumnName = "id", foreignKey = @ForeignKey(name = "FK_cardimg_1"))
    private ImageTemplate imageTemplate1;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "card_idx2", referencedColumnName = "id", foreignKey = @ForeignKey(name = "FK_cardimg_2"))
    private ImageTemplate imageTemplate2;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "card_idx3", referencedColumnName = "id", foreignKey = @ForeignKey(name = "FK_cardimg_3"))
    private ImageTemplate imageTemplate3;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "card_idx4", referencedColumnName = "id", foreignKey = @ForeignKey(name = "FK_cardimg_4"))
    private ImageTemplate imageTemplate4;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "card_idx5", referencedColumnName = "id", foreignKey = @ForeignKey(name = "FK_cardimg_5"))
    private ImageTemplate imageTemplate5;

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