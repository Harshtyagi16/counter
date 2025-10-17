import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  final int value;
  const CounterDisplay({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: curved, child: child),
        );
      },
      child: Text(
        '$value',
        key: ValueKey<int>(value),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 96,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: -2,
        ),
      ),
    );
  }
}
