import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/application.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          children: [
            ListTile(
              title: const Text('Sugar Free'),
              leading: Checkbox(
                value: context.read<FilterCubit>().isFactSelected('Sugar Free'),
                onChanged: (value) {
                  context
                      .read<FilterCubit>()
                      .toggleFact('Sugar Free', value ?? false);
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: const Text('Healthy'),
              leading: Checkbox(
                value: context.read<FilterCubit>().isFactSelected('Healthy'),
                onChanged: (value) {
                  context
                      .read<FilterCubit>()
                      .toggleFact('Healthy', value ?? false);
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: const Text('Fast Cook'),
              leading: Checkbox(
                value: context.read<FilterCubit>().isFactSelected('Fast Cook'),
                onChanged: (value) {
                  context
                      .read<FilterCubit>()
                      .toggleFact('Fast Cook', value ?? false);
                  setState(() {});
                },
              ),
            ),
            // Add more facts as needed
            ElevatedButton(
              onPressed: () {
                /*final selectedFacts = context
                    .read<FilterCubit>()
                    .selectedFacts
                    .keys
                    .where((fact) =>
                        context.read<FilterCubit>().isFactSelected(fact))
                    .toList();

                context.read<FilterCubit>().filterMealsByFacts(selectedFacts);*/
                setState(() {

                });
                Navigator.pop(context); // Close the bottom sheet
              },
              child: const Text('Apply Filters'),
            ),
          ],
        ),
      ],
    );
  }
}
