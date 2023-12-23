import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

class CalorieRangeSlider extends StatefulWidget {
  final int minCalories;
  final int maxCalories;
  final Function(int, int) onRangeChanged;

  const CalorieRangeSlider({
    super.key,
    required this.minCalories,
    required this.maxCalories,
    required this.onRangeChanged,
  });

  @override
  CalorieRangeSliderState createState() => CalorieRangeSliderState();
}

class CalorieRangeSliderState extends State<CalorieRangeSlider> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = RangeValues(
      widget.minCalories.toDouble(),
      widget.maxCalories.toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            'Calorie Range: ${_currentRangeValues.start.round()} - ${_currentRangeValues.end.round()}'),
        RangeSlider(
          activeColor: AppColors.deepTeal,
          inactiveColor: Colors.black26,
          values: _currentRangeValues,
          min: widget.minCalories.toDouble(),
          max: widget.maxCalories.toDouble(),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
          onChangeEnd: (RangeValues values) {
            widget.onRangeChanged(values.start.round(), values.end.round());
          },
        ),
      ],
    );
  }
}
