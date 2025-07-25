import 'package:flutter/material.dart';
import 'package:waveauth/screen/login.dart';
import 'package:waveauth/screen/wave_screen.dart';
import 'package:waveauth/screen/auth_entry.dart';
import 'package:waveauth/widget/slide_switcher.dart';

enum AuthType { login, entry }

class AuthScreen extends StatefulWidget {
  final AuthType authType;
  const AuthScreen({super.key, required this.authType});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthType _currentAuthType;

  @override
  void initState() {
    super.initState();
    _currentAuthType = widget.authType;
  }

  void _updateAuthType(AuthType newType) {
    setState(() {
      _currentAuthType = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PopScope(
      canPop:
          _currentAuthType !=
          AuthType.login, // Only allow popping when not on login
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (_currentAuthType == AuthType.login) {
          // If we're on login and can't pop, go back to entry
          setState(() {
            _currentAuthType = AuthType.entry;
          });
        }
      },
      child: Scaffold(
        floatingActionButton: _currentAuthType != AuthType.entry
            ? Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 70.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: FloatingActionButton(
                    heroTag: 'back_button',
                    mini: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onPressed: () => _updateAuthType(AuthType.entry),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              )
            : null,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            const WaveScreen(),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.3,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SlideSwitcher(
                  direction: _currentAuthType == AuthType.login
                      ? AxisDirection.left
                      : AxisDirection.right,
                  child: switch (_currentAuthType) {
                    AuthType.login => LoginScreen(
                      key: const ValueKey('login'), // ✅ Assign a key to child
                      onBack: () => _updateAuthType(AuthType.entry),
                    ),
                    AuthType.entry => AuthEntry(
                      key: const ValueKey(
                        'entry',
                      ), // ✅ Assign a different key to child
                      onLoginPressed: () => _updateAuthType(AuthType.login),
                      onCreateAccountPressed: () =>
                          _updateAuthType(AuthType.login),
                    ),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
