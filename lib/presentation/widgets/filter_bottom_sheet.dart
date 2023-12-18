import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/cubits/filter/filter_cubit.dart';


class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          title: Text('Sugar Free'),
          leading: Checkbox(
            value: context.read<FilterCubit>().isFactSelected('Sugar Free'),
            onChanged: (value) {
              context.read<FilterCubit>().toggleFact('Sugar Free', value ?? false);
            },
          ),
        ),
        ListTile(
          title: const Text('Healthy'),
          leading: Checkbox(
            value: context.read<FilterCubit>().isFactSelected('Healthy'),
            onChanged: (value) {
              context.read<FilterCubit>().toggleFact('Healthy', value ?? false);
            },
          ),
        ),
        ListTile(
          title: Text('Fast Cook'),
          leading: Checkbox(
            value: context.read<FilterCubit>().isFactSelected('Fast Cook'),
            onChanged: (value) {
              context.read<FilterCubit>().toggleFact('Fast Cook', value ?? false);
            },
          ),
        ),
        // Add more facts as needed
        ElevatedButton(
          onPressed: () {
            final selectedFacts = context.read<FilterCubit>().selectedFacts.keys
                .where((fact) => context.read<FilterCubit>().isFactSelected(fact))
                .toList();

            context.read<FilterCubit>().filterMealsByFacts(selectedFacts);
            Navigator.pop(context); // Close the bottom sheet
          },
          child: Text('Apply Filters'),
        ),
      ],
    );
  }
}
