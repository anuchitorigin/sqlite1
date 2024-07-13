import 'package:flutter/material.dart';
// import 'package:sqlite1/pages/home.dart';
// import 'package:sqlite1/pages/start.dart';
import 'package:sqlite1/pages/list.dart';
import 'package:sqlite1/pages/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/list',
      routes: {
        /// If specify '/' route, Flutter will create a root page every time application starts.
        /// This route can omit.
        // '/': (context) => const HomePage(),
        // '/start': (context) => const StartPage(),
        '/list': (context) => const ListPage(),
        '/item': (context) => const ItemPage(),
      },
    );
  }
}
