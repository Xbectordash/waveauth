import 'package:flutter/material.dart';
import 'package:waveauth/screen/otp_screen.dart';
import 'package:waveauth/util/const_string.dart';
import 'package:waveauth/widget/gradent_button.dart';
import 'package:waveauth/widget/gradient_checkbox.dart';
import 'package:waveauth/widget/page_route_transiton.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController emailController;
  final TextEditingController passWordController;

  const LoginForm({
    super.key,
    required this.formkey,
    required this.emailController,
    required this.passWordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isCheckd = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: ConstString.emailLabel,
              hintText: ConstString.emailHint,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return ConstString.emailRequiredError;
              }
              if (!value.contains('@')) {
                return ConstString.emailInvalidError;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: widget.passWordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: ConstString.passwordLabel,
              hintText: ConstString.passwordHint,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return ConstString.passwordRequiredError;
              }
              if (value.length < 6) {
                return ConstString.passwordLengthError;
              }
              return null;
            },
          ),
          // const SizedBox(height: 12),
          Row(
            children: [
              GradientCircularCheckbox(
                value: _isCheckd,
                onChanged: (val) => setState(() => _isCheckd = val),
              ),
              const SizedBox(width: 10),
              const Text(
                ConstString.rememberMe,
                style: TextStyle(color: Colors.grey),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(ConstString.forgotPassword),

              ),
            ],
          ),

          const SizedBox(height: 5),
          GradientButton(
            buttonText: ConstString.LoginString,
            isInvert: true,
            onPressed: () {
              if (widget.formkey.currentState!.validate()) {
                // Login logic here
                debugPrint('Email: ${widget.emailController.text}');
                debugPrint('Password: ${widget.passWordController.text}');
              }
              Navigator.push(
                context,
                CustomPageTransition.slideFromLeft(OtpScreen())
              );
            },
          ),
        ],
      ),
    );
  }
}

