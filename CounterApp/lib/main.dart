import 'package:flutter/material.dart';
import 'widgets/counter_display.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const CounterHomePage(),
    );
  }
}

class CounterHomePage extends StatefulWidget {
  const CounterHomePage({super.key});

  @override
  State<CounterHomePage> createState() => _CounterHomePageState();
}

class _CounterHomePageState extends State<CounterHomePage> {
  int counter = 0;

  void increment() => setState(() => counter++);
  void decrement() => setState(() => counter--);
  void reset() => setState(() => counter = 0);

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [Color(0xFF1976D2), Color(0xFF8E24AA)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterDisplay(value: counter),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton.icon(
                      onPressed: decrement,
                      icon: const Icon(Icons.remove),
                      label: const Text('Decrement'),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton.icon(
                      onPressed: reset,
                      icon: const Icon(Icons.restart_alt),
                      label: const Text('Reset'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: increment,
        icon: const Icon(Icons.add),
        label: const Text('Increment'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
