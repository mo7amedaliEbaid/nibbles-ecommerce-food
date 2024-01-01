import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../core/constants/colors.dart';

class LoadingTicker extends StatefulWidget {
  const LoadingTicker({super.key, required this.text});
  final String text;
  @override
  _LoadingTickerState createState() => _LoadingTickerState();
}

class _LoadingTickerState extends State<LoadingTicker>
    with TickerProviderStateMixin {
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
      "${widget.text}${"." * (_controller.value * 10).floor()}",
      // Display 1 to 3 dots based on the animation value
      style: AppText.h3b?.copyWith(color: AppColors.antiqueRuby),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class TapToScanTicker extends StatefulWidget {
  @override
  _TapToScanTickerState createState() => _TapToScanTickerState();
}

class _TapToScanTickerState extends State<TapToScanTicker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInOut;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create a Tween sequence for fading in and out
    _fadeInOut = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 2.0), weight: 2),
      TweenSequenceItem(tween: Tween<double>(begin: 2.0, end: 0.0), weight: 2),
    ]).animate(_controller);

    // Start the animation loop
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeInOut,
      child: Text(
        'Tap to scan'.toUpperCase(),
        style: AppText.b1b?.copyWith(color: AppColors.antiqueRuby),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the AnimationController to free up resources
    _controller.dispose();
    super.dispose();
  }
}
