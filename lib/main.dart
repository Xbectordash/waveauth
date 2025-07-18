import 'package:flutter/material.dart';
import 'package:waveauth/screen/auth_screen.dart';

import 'package:waveauth/screen/wave_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:AuthScreen() ,);
  }
}