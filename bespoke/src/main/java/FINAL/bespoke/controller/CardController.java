package FINAL.bespoke.controller;

import FINAL.bespoke.model.dto.CardDto;
import FINAL.bespoke.model.dto.CardItemDto;
import FINAL.bespoke.model.entity.Card;
import FINAL.bespoke.model.entity.FieldComment;
import FINAL.bespoke.service.CardService;
import lombok.RequiredArgsConstructor;
import org.hibernate.annotations.Comment;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/card")
@CrossOrigin("*")
@RequiredArgsConstructor
public class CardController {
    private final CardService cardService;

    /**
     * Card객체의 컬럼을 전부 가져와서 items 에 넣어줌,
     * 이 때, label은 FieldComment의 값(Card객체에 있음),
     * @param model
     * @return card's column List ({label: @FieldComment, name: columnName})
     */
    @GetMapping("/cardAdd")
    public String cardAdd(Model model) {

        List<CardItemDto> items = new ArrayList<>();

        Field[] fields = Card.class.getDeclaredFields();
        for (Field field : fields) {
            FieldComment annotation = field.getAnnotation(FieldComment.class);
            String label = "";
            if (annotation != null) {
                label = annotation.value();
            }
            String name = field.getName();
            items.add(new CardItemDto(label, name));
        }

        model.addAttribute("items", items);

        return "cardAdd/cardAdd";
    }

    @PostMapping(path = "/cardAdd", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    public String cardAdd(@RequestPart(name = "files", required = false) MultipartFile file,
                          @ModelAttribute CardDto cardDto, Model model) {
        cardService.saveCard(cardDto);
        return "redirect:cardAdd";
    }
}
