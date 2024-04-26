package FINAL.bespoke.service;

import FINAL.bespoke.model.dto.CardDto;
import FINAL.bespoke.model.entity.Card;
import FINAL.bespoke.repository.CardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CardService {
    private final CardRepository cardRepository;

    public void saveCard(CardDto card) {
        Optional<Card> optional = cardRepository.findById(card.getCard());

        if (optional.isPresent()) {
//            나중에 업데이트해야한다면 여기 사용
//            Card cardToSave = optional.get();
        } else {
            Card cardToSave = new Card(card);
            cardRepository.save(cardToSave);
        }
    }
}
