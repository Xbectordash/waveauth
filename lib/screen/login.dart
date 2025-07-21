import 'package:flutter/material.dart';
import 'package:waveauth/screen/auth_screen.dart';
import 'package:waveauth/widget/login_form.dart';
import 'package:waveauth/widget/social_media.dart';
class LoginScreen extends StatefulWidget {
  final VoidCallback? onBack;
  const LoginScreen({super.key, this.onBack});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 20,
        left: 24,
        right: 24,
        bottom: viewInsets + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.onBack != null)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: widget.onBack,
              ),
            ),
          const SizedBox(height: 20),
          LoginForm(
            formkey: _formkey,
            emailController: _emailController,
            passWordController: _passWordController,
          ),
          const SizedBox(height: 24),
          SocialSignInWidget(authType: AuthType.login),
        ],
      ),
    );
  }
}
