/// Base abstract class for all Jokers
abstract class Joker {
  const Joker({
    required this.name,
    required this.assetPath,
    required this.rarity,
    required this.cost,
    required this.type,
  });

  final String name;
  final String assetPath;
  final String rarity;
  final int cost;
  final String type;
}
