package FINAL.bespoke.model.entity;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.Entity;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Recommendation {
    @Id
    private String SEQ;
    private int Top1;
    private int Top2;
    private int Top3;
    private int Top4;
    private int Top5;
}