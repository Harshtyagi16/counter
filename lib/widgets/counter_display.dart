import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  final int value;
  const CounterDisplay({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white) ??
        const TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: Colors.white);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: Text(
        '$value',
        key: ValueKey<int>(value),
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
