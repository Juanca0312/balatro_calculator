enum HandType {
  highCard,
  pair,
  twoPair,
  threeOfAKind,
  straight,
  flush,
  fullHouse,
  fourOfAKind,
  straightFlush,
  royalFlush,
  // quintet,
}

//TODO: Localize
extension HandTypeExtension on HandType {
  String get title {
    switch (this) {
      case HandType.highCard:
        return 'Carta mayor';
      case HandType.pair:
        return 'Par';
      case HandType.twoPair:
        return 'Doble par';
      case HandType.threeOfAKind:
        return 'Tercia';
      case HandType.straight:
        return 'Escalera';
      case HandType.flush:
        return 'Color';
      case HandType.fullHouse:
        return 'Full house';
      case HandType.fourOfAKind:
        return 'Póker';
      case HandType.straightFlush:
        return 'Escalera color';
      case HandType.royalFlush:
        return 'Escalera real';
    }
  }

  String get description {
    switch (this) {
      case HandType.highCard:
        return 'Si la mano jugada no es ninguna de las anteriores. Solo cuenta la carta mas alta';
      case HandType.pair:
        return '2 cartas de la misma categoría. Pueden jugarse con otras 3 cartas que no cuentan';
      case HandType.twoPair:
        return '2 pares de cartas de categorías diferentes. Pueden jugarse con 1 otra carta que no cuenta';
      case HandType.threeOfAKind:
        return '3 cartas de la misma categoría. Pueden jugarse con 2 cartas que no cuentan';
      case HandType.straight:
        return '5 cartas seguidas (valores consecutivos)';
      case HandType.flush:
        return '5 cartas del mismo palo';
      case HandType.fullHouse:
        return 'Una tercia y un par';
      case HandType.fourOfAKind:
        return '4 cartas de la misma categoría. Pueden jugarse con 1 otra carta que no cuenta';
      case HandType.straightFlush:
        return '5 cartas seguidas (valores consecutivos) con todas las cartas del mismo palo';
      case HandType.royalFlush:
        return '5 cartas seguidas que sean A K Q J 10';
    }
  }
}
