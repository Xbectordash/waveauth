import 'package:flutter/material.dart';
import 'package:waveauth/util/const_String.dart';
import 'package:waveauth/widget/gradent_button.dart';
import 'package:waveauth/screen/auth_screen.dart';
import 'package:waveauth/widget/social_media.dart';

class AuthEntry extends StatefulWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onCreateAccountPressed;
  
  const AuthEntry({
    super.key, 
    required this.onLoginPressed,
    required this.onCreateAccountPressed,
  });

  @override
  State<AuthEntry> createState() => _AuthEntryState();
}

class _AuthEntryState extends State<AuthEntry> {
 @override
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: constraints.maxHeight,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 40),
              Text(
                ConstString.WelcomeString,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 80),
              GradientButton(
                buttonText: ConstString.CreateAccountString,
                onPressed: widget.onCreateAccountPressed,
              ),
              const SizedBox(height: 10),
              GradientButton(
                buttonText: ConstString.LoginString,
                onPressed: widget.onLoginPressed,
                isInvert: true,
              ),
              const SizedBox(height: 10),
              SocialSignInWidget(authType: AuthType.entry),
            ],
          ),
        ),
      );
    },
  );
}
}