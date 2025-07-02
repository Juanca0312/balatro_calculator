import 'package:balatro_calculator/core/entities/hand_score.dart';
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
