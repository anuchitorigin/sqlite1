import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Demo'),
      ),
      body: const Center(
        child: Text('Hello World!',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
