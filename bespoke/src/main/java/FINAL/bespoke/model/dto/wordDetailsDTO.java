package FINAL.bespoke.model.dto;

import java.util.List;

public class wordDetailsDTO {
	 private List<String> cardName;
	    private List<String> cardWord;

	    public wordDetailsDTO(List<String> cardIds, List<String> cardWord) {
	        this.cardName = cardIds;
	        this.cardWord = cardWord;
	    }

		public List<String> getCardName() {
	        return cardName;
	    }

	    public List<String> getCardWord() {
	        return cardWord;
	    }
}
