enum CardRank {
  A('A', 11, 14),
  two('2', 2, 2),
  three('3', 3, 3),
  four('4', 4, 4),
  five('5', 5, 5),
  six('6', 6, 6),
  seven('7', 7, 7),
  eight('8', 8, 8),
  nine('9', 9, 9),
  ten('10', 10, 10),
  J('J', 10, 11),
  Q('Q', 10, 12),
  K('K', 10, 13);

  const CardRank(this.symbol, this.gameScore, this.value);

  final String symbol;
  final int gameScore;
  final int value;
}
