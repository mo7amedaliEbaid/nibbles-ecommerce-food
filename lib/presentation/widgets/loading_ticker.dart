import 'package:flutter/material.dart';

import '../../configs/app_typography.dart';
import '../../core/constants/colors.dart';

class LoadingTicker extends StatefulWidget {
  const LoadingTicker({super.key});

  @override
  _LoadingTickerState createState() => _LoadingTickerState();
}

class _LoadingTickerState extends State<LoadingTicker> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Adjust the duration as needed
    )..repeat(reverse: true); // Repeats the animation

    // Add a listener to update the state when the animation changes
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "LOADING${"." * (_controller.value * 10).floor()}", // Display 1 to 3 dots based on the animation value
      style: AppText.h3b?.copyWith(color: AppColors.antiqueRuby),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
