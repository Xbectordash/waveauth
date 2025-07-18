import 'package:flutter/material.dart';
import 'package:waveauth/screen/wave_screen.dart';
import 'package:waveauth/widget/auth_entry.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          WaveScreen(),
          Positioned(
            top:size.height*0.3,
            child: AuthEntry()
            )

        ],
      ),
    );
  }
}