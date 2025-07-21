import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:waveauth/screen/auth_screen.dart';
import 'package:waveauth/util/const_colors.dart';
import 'package:waveauth/util/const_string.dart';
// To use specific social icons, you might need a package like font_awesome_flutter.
// Add `font_awesome_flutter: ^10.1.0` to your pubspec.yaml
// and import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Then you can use icons like FaIcon(FontAwesomeIcons.twitter).
// For this example, standard Material icons are used as placeholders.

/// A widget that displays a social sign-in interface.
///
/// This includes a "Sign Up" prompt, a divider with "OR", a row of
/// social media login buttons, and a final text prompt.
/// It is designed to be placed within a screen's body.
class SocialSignInWidget extends StatelessWidget {
  final AuthType authType;
  const SocialSignInWidget({super.key, required this.authType});

  @override
  Widget build(BuildContext context) {
    // This widget is designed to be flexible and can be placed inside any
    // container, like a Column, Center, or Padding widget in your main screen file.
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 350),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // To make the column only take needed space
        children: [
          const SizedBox(height: 16),
          // --- "New user? Sign Up" Text ---
          if (authType != AuthType.entry) ...[
          _buildSignUpText(),
          const SizedBox(height: 16),
          // --- "OR" Divider ---
          _buildDividerWithText(),
          const SizedBox(height: 16)
          ],

          // --- Social Media Icons ---
          _buildSocialIconsRow(),
          const SizedBox(height: 16),

          // --- "Sign in with another account" Text ---
          const Text(
            ConstString.signInWithAnotherAccount,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the "New user? Sign Up" text with different styles.
  Widget _buildSignUpText() {
    return ShaderMask(
      shaderCallback: (bounds) => AppGradients.mainGradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontFamily: 'Inter', // Ensuring a consistent font
          ),
          children: <TextSpan>[
            const TextSpan(text: ConstString.newUserSignUp),
            TextSpan(
              text: ConstString.signUp,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white, // This will be masked by the shader
              ),
              // You could add a recognizer here for tap events:
              // recognizer: TapGestureRecognizer()..onTap = () {
              //   print('Navigate to Sign Up');
              // },
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the horizontal rule with "OR" in the middle.
  Widget _buildDividerWithText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: AppGradients.mainGradient,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              ConstString.orDividerText,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.accent, Colors.grey.shade300],
                  begin: Alignment.center,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the row of social media login icons.
  Widget _buildSocialIconsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildSocialIcon(
          icon: SimpleIcons.x, // Placeholder for Twitter
          color: const Color(0xFF1DA1F2),
        ),
        const SizedBox(width: 20),
        _buildSocialIcon(
          icon: SimpleIcons.discord, // Placeholder for LinkedIn
          color: const Color(0xFF0A66C2),
        ),
        const SizedBox(width: 20),
        _buildSocialIcon(
          icon: SimpleIcons.instagram, // Placeholder for Facebook
          color: const Color(0xFF1877F2),
        ),
        const SizedBox(width: 20),
        _buildSocialIcon(
          icon: SimpleIcons.google, // Placeholder for Google
          color: const Color(0xFFDB4437),
          iconSize: 18,
        ),
      ],
    );
  }

  /// Helper widget to create a single circular social icon.
  Widget _buildSocialIcon({required IconData icon, required Color color, double iconSize = 24.0}) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        gradient: AppGradients.mainGradient,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}
