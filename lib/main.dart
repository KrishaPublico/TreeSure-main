import 'package:flutter/material.dart';

import 'package:treesure_app/features/intro/intro_page.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Treesure App',
      home: IntroPage(),
    
    );
  }
}
