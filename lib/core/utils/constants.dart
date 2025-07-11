import 'package:balatro_calculator/core/entities/hand_score.dart';
import 'package:balatro_calculator/core/entities/jokers/joker.dart';
import 'package:balatro_calculator/core/entities/jokers/score_jocker.dart';
import 'package:balatro_calculator/core/enums/card_suit.dart';
import 'package:balatro_calculator/core/enums/hand_type.dart';

const handScores = [
  HandScore(handType: HandType.highCard, scores: [0, 10, 20, 30]),
  HandScore(handType: HandType.pair, scores: [10, 20, 30, 40]),
  HandScore(handType: HandType.twoPair, scores: [30, 50, 70, 90]),
  HandScore(handType: HandType.threeOfAKind, scores: [70, 100, 130, 160]),
  HandScore(handType: HandType.straight, scores: [90, 130, 170, 210]),
  HandScore(handType: HandType.flush, scores: [130, 160, 190, 220]),
  HandScore(handType: HandType.fullHouse, scores: [180, 220, 260, 300]),
  HandScore(handType: HandType.fourOfAKind, scores: [220, 270, 320, 370]),
  HandScore(handType: HandType.straightFlush, scores: [250, 310, 370, 430]),
  HandScore(handType: HandType.royalFlush, scores: [300, 380, 460, 540]),
  // Quinteto descartado por testeo
];

const orderedHands = [
  // HandType.quintet,
  HandType.royalFlush,
  HandType.straightFlush,
  HandType.fourOfAKind,
  HandType.fullHouse,
  HandType.flush,
  HandType.straight,
  HandType.threeOfAKind,
  HandType.twoPair,
  HandType.pair,
  HandType.highCard,
];

final List<Joker> jokers = [
  FixedChipJoker(
    name: 'Joker básico',
    description: 'Otorga 30 fichas',
    assetPath: 'assets/jokers/basic.webp',
    rarity: 'Común',
    cost: 200,
    type: 'fichas+',
    bonus: 30,
  ),
  SuitBasedJoker(
    name: 'Joker codicioso',
    description:
        'Otorga 20 fichas por cada carta de diamante jugada en la mano',
    assetPath: 'assets/jokers/codicioso.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    suit: CardSuit.diamonds,
    multiplier: 20,
  ),
  SuitBasedJoker(
    name: 'Joker lujurioso',
    description: 'Otorga 20 fichas por cada carta de corazon jugada en la mano',
    assetPath: 'assets/jokers/lujurioso.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    suit: CardSuit.hearts,
    multiplier: 20,
  ),
  SuitBasedJoker(
    name: 'Joker iracundo',
    description: 'Otorga 20 fichas por cada carta de espadas jugada en la mano',
    assetPath: 'assets/jokers/iracundo.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    suit: CardSuit.spades,
    multiplier: 20,
  ),
  SuitBasedJoker(
    name: 'Joker glotón',
    description: 'Otorga 20 fichas por cada carta de trébol jugada en la mano',
    assetPath: 'assets/jokers/gloton.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    suit: CardSuit.clubs,
    multiplier: 20,
  ),
  HandTypeJoker(
    name: 'Joker feliz',
    description:
        'Otorga 50 fichas si la mano jugada tiene un par (valido para par, doble par, trio, full house y poker)',
    assetPath: 'assets/jokers/feliz.webp',
    rarity: 'Común',
    cost: 300,
    type: 'fichas+',
    validTypes: [
      HandType.pair,
      HandType.twoPair,
      HandType.threeOfAKind,
      HandType.fullHouse,
      HandType.fourOfAKind,
    ],
    bonus: 50,
  ),
  HandTypeJoker(
    name: 'Joker amistoso',
    description:
        'Otorga 70 fichas si la mano jugada tiene un doble par (valido para doble par, full house y poker)',
    assetPath: 'assets/jokers/amistoso.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    validTypes: [HandType.twoPair, HandType.fullHouse, HandType.fourOfAKind],
    bonus: 70,
  ),
  HandTypeJoker(
    name: 'Joker estrafalario',
    description:
        'Otorga 80 fichas si la mano jugada tiene un trio (valido para trio, full house y poker)',
    assetPath: 'assets/jokers/estrafalario.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    validTypes: [
      HandType.threeOfAKind,
      HandType.fullHouse,
      HandType.fourOfAKind,
    ],
    bonus: 80,
  ),
  HandTypeJoker(
    name: 'Joker extravagante',
    description:
        'Otorga 120 fichas si la mano jugada tiene una escalera (valido para escalera, escalera de color y escalera real)',
    assetPath: 'assets/jokers/extravagante.webp',
    rarity: 'Común',
    cost: 500,
    type: 'fichas+',
    validTypes: [
      HandType.straight,
      HandType.straightFlush,
      HandType.royalFlush,
    ],
    bonus: 120,
  ),
  HandTypeJoker(
    name: 'Joker gracioso',
    description:
        'Otorga 90 fichas si la mano jugada tiene color (valido para color y escalera de color)',
    assetPath: 'assets/jokers/gracioso.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    validTypes: [HandType.flush, HandType.straightFlush],
    bonus: 90,
  ),
];
