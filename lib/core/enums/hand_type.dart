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
  String get description {
    switch (this) {
      case HandType.highCard:
        return 'Carta mayor';
      case HandType.pair:
        return 'Par';
      case HandType.twoPair:
        return 'Doble par';
      case HandType.threeOfAKind:
        return 'Trío';
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
}
