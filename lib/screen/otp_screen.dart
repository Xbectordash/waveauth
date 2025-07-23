import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:waveauth/config/app_themes.dart';

import 'package:waveauth/util/const_colors.dart';
import 'package:waveauth/util/const_string.dart';
import 'package:waveauth/util/const_text_style.dart';
import 'package:waveauth/widget/gradent_button.dart';
import 'package:waveauth/widget/opt_background.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: OptBackground(size: Size(size.width, size.height * 0.5)),
            ),

            Center(
              child: Column(
                children: [
                  Text(
                    ConstString.otpRegister,
                    style: AppTextStyles.heading.copyWith(fontSize: 32),
                  ),
                  SizedBox(height: 10),
                  Text(
                    ConstString.enterCodeToSent,
                    style: AppTextStyles.subheading.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    ConstString.otpNumber,
                    style: AppTextStyles.subheading.copyWith(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Pinput(
                    length: 4,
                    defaultPinTheme: AppTheme.defaultPinTheme,
                    focusedPinTheme: AppTheme.defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.blueAccent),
                      ),
                    ),
                    showCursor: true,
                    onCompleted: (pin) => print('Entered: $pin'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    ConstString.idintRecivedCode,
                    style: AppTextStyles.subheading.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(ConstString.resndOtpCode,style:  AppTextStyles.subheading.copyWith(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),),
                    SizedBox(height: 16),
                    GradientButton(buttonText: ConstString.verifyCode, onPressed: (){})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
