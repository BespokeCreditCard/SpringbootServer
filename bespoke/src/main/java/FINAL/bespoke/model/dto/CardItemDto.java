package FINAL.bespoke.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CardItemDto {
    private String label;
    private String name;

    public CardItemDto(String label, String name) {
        this.label = label;
        this.name = name;
    }
}
