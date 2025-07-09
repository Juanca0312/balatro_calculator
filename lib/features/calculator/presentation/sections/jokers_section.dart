import 'package:balatro_calculator/core/theme/app_colors.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/jokers/jokers_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/widgets/joker_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokersSection extends StatelessWidget {
  const JokersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final state = context.select((JokersCubit cubit) => cubit.state);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            'Jokers',
            style: textTheme.headlineSmall?.copyWith(color: colorScheme.green),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextField(
            onChanged:
                (value) => context.read<JokersCubit>().filterByQuery(value),
            decoration: const InputDecoration(
              hintText: 'Buscar joker...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // puedes ajustar a 4 o más en tablets
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7, // ajusta según tu imagen
              ),
              itemCount: state.filteredJokers.length,
              itemBuilder: (context, index) {
                final joker = state.filteredJokers[index];
                final isSelected = state.selectedJokers.contains(joker);
                final cubit = context.read<JokersCubit>();

                return JokerCardTile(
                  joker: joker,
                  isSelected: isSelected,
                  onTap:
                      () =>
                          isSelected
                              ? cubit.removeJoker(joker)
                              : cubit.selectJoker(joker),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
