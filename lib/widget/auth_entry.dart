import 'package:flutter/material.dart';
import 'package:waveauth/util/const_String.dart';

class AuthEntry extends StatefulWidget {
  const AuthEntry({super.key});

  @override
  State<AuthEntry> createState() => _AuthEntryState();
}

class _AuthEntryState extends State<AuthEntry> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ConstString.WelcomeString,
          ),
      ],
    );
  }
}