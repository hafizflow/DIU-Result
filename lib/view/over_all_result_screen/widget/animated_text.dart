import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CAnimatedText extends StatelessWidget {
  const CAnimatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(animatedTexts: [
      ColorizeAnimatedText(
        'For More Information >>>',
        textStyle: const TextStyle(
          color: Colors.teal,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        colors: [
          const Color(0xFFAAFFF8),
          const Color(0xFFF8DE22),
          const Color(0xFFF11A7B),
          const Color(0xFF5C48AF),
        ],
        speed: const Duration(seconds: 1),
      ),
    ]);
  }
}
