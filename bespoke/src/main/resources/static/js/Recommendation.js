document.getElementById("prev").addEventListener("click", function() {
  moveCarousel(-1);
});

document.getElementById("next").addEventListener("click", function() {
  moveCarousel(1);
});

function moveCarousel(direction) {
  var selectedCard = document.querySelector(".selected");
  var prevCard = selectedCard.previousElementSibling || selectedCard.parentNode.lastElementChild;
  var nextCard = selectedCard.nextElementSibling || selectedCard.parentNode.firstElementChild;

  // 버튼 비활성화
  var prevButton = document.getElementById("prev");
  var nextButton = document.getElementById("next");
  prevButton.disabled = true;
  nextButton.disabled = true;

  // 이동 가능한 경우에만 이동
  if (direction === -1 && !prevCard.classList.contains('prevLeftSecond') && !prevCard.classList.contains('prev')) {
    return;
  } else if (direction === 1 && !nextCard.classList.contains('next') && !nextCard.classList.contains('nextRightSecond')) {
    return;
  }

  selectedCard.classList.remove("selected");
  prevCard.classList.remove("prevLeftSecond", "prev");
  nextCard.classList.remove("next", "nextRightSecond");

  if (direction === -1) {
    // 왼쪽으로 이동
    selectedCard.classList.add("next");
    prevCard.classList.add("selected");
    nextCard.classList.add("nextRightSecond");
  } else {
    // 오른쪽으로 이동
    selectedCard.classList.add("prev");
    nextCard.classList.add("selected");
    prevCard.classList.add("prevLeftSecond");
  }

  // 첫 번째나 마지막 카드에 도달하면 해당 방향의 버튼만 활성화
  if (!prevCard.previousElementSibling) {
    prevButton.disabled = true;
  } else {
    prevButton.disabled = false;
  }
  if (!nextCard.nextElementSibling) {
    nextButton.disabled = true;
  } else {
    nextButton.disabled = false;
  }
}
