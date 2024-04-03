package FINAL.bespoke.model.entity;

import jakarta.persistence.Id;
import jakarta.persistence.Entity;

@Entity
public class Recommendation {
    @Id
    private String SEQ;
    private String Top1;
    private String Top2;
    private String Top3;
    private String Top4;
    private String Top5;

    public Recommendation() {}

    public String getSeq() {
        return SEQ;
    }

    public void setSeq(String SEQ) {
        this.SEQ = SEQ;
    }

    public String getTop1() {
        return Top1;
    }

    public void setTop1(String Top1) {
        this.Top1 = Top1;
    }

    public String getTop2() {
        return Top2;
    }

    public void setTop2(String Top2) {
        this.Top2 = Top2;
    }

    public String getTop3() {
        return Top3;
    }

    public void setTop3(String Top3) {
        this.Top3 = Top3;
    }

    public String getTop4() {
        return Top4;
    }

    public void setTop4(String Top4) {
        this.Top4 = Top4;
    }

    public String getTop5() {
        return Top5;
    }

    public void setTop5(String Top5) {
        this.Top5 = Top5;
    }
}