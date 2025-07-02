import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/enums/card_rank.dart';
import 'package:balatro_calculator/core/enums/card_suit.dart';
import 'package:balatro_calculator/core/enums/hand_type.dart';
import 'package:balatro_calculator/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HandExampleDialog extends StatelessWidget {
  const HandExampleDialog({super.key, required this.hand});

  final HandType hand;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      title: Text(
        hand.title,
        style: textTheme.headlineSmall?.copyWith(color: colorScheme.green),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  exampleCardsFor(hand)
                      .map(
                        (card) => Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Image.asset(
                            card.assetPath,
                            width: 40,
                            height: 60,
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
          const SizedBox(height: 16),
          Text(hand.description, textAlign: TextAlign.center),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Ok'),
        ),
      ],
    );
  }

  List<DeckCard> exampleCardsFor(HandType handType) {
    switch (handType) {
      case HandType.highCard:
        return [DeckCard.create(CardSuit.hearts, CardRank.A)];
      case HandType.pair:
        return [
          DeckCard.create(CardSuit.hearts, CardRank.two),
          DeckCard.create(CardSuit.spades, CardRank.two),
        ];
      case HandType.twoPair:
        return [
          DeckCard.create(CardSuit.hearts, CardRank.J),
          DeckCard.create(CardSuit.clubs, CardRank.J),
          DeckCard.create(CardSuit.spades, CardRank.four),
          DeckCard.create(CardSuit.diamonds, CardRank.four),
        ];
      case HandType.threeOfAKind:
        return [
          DeckCard.create(CardSuit.hearts, CardRank.K),
          DeckCard.create(CardSuit.clubs, CardRank.K),
          DeckCard.create(CardSuit.diamonds, CardRank.K),
        ];
      case HandType.straight:
        return [
          DeckCard.create(CardSuit.hearts, CardRank.five),
          DeckCard.create(CardSuit.clubs, CardRank.six),
          DeckCard.create(CardSuit.spades, CardRank.seven),
          DeckCard.create(CardSuit.diamonds, CardRank.eight),
          DeckCard.create(CardSuit.hearts, CardRank.nine),
        ];
      case HandType.flush:
        return [
          DeckCard.create(CardSuit.spades, CardRank.two),
          DeckCard.create(CardSuit.spades, CardRank.five),
          DeckCard.create(CardSuit.spades, CardRank.seven),
          DeckCard.create(CardSuit.spades, CardRank.J),
          DeckCard.create(CardSuit.spades, CardRank.K),
        ];
      case HandType.fullHouse:
        return [
          DeckCard.create(CardSuit.hearts, CardRank.Q),
          DeckCard.create(CardSuit.clubs, CardRank.Q),
          DeckCard.create(CardSuit.spades, CardRank.Q),
          DeckCard.create(CardSuit.diamonds, CardRank.five),
          DeckCard.create(CardSuit.clubs, CardRank.five),
        ];
      case HandType.fourOfAKind:
        return [
          DeckCard.create(CardSuit.hearts, CardRank.nine),
          DeckCard.create(CardSuit.spades, CardRank.nine),
          DeckCard.create(CardSuit.clubs, CardRank.nine),
          DeckCard.create(CardSuit.diamonds, CardRank.nine),
        ];
      case HandType.straightFlush:
        return [
          DeckCard.create(CardSuit.hearts, CardRank.six),
          DeckCard.create(CardSuit.hearts, CardRank.seven),
          DeckCard.create(CardSuit.hearts, CardRank.eight),
          DeckCard.create(CardSuit.hearts, CardRank.nine),
          DeckCard.create(CardSuit.hearts, CardRank.ten),
        ];
      case HandType.royalFlush:
        return [
          DeckCard.create(CardSuit.spades, CardRank.ten),
          DeckCard.create(CardSuit.spades, CardRank.J),
          DeckCard.create(CardSuit.spades, CardRank.Q),
          DeckCard.create(CardSuit.spades, CardRank.K),
          DeckCard.create(CardSuit.spades, CardRank.A),
        ];
    }
  }
}
