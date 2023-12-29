import 'package:feedback_bot/features/feedbackBot/presentation/views/mobile_home.dart';
import 'package:feedback_bot/features/feedbackBot/presentation/views/desktop_home.dart';
import 'package:flutter/material.dart';

class LayoutHome extends StatelessWidget {
  const LayoutHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return const DesktopLayoutHome();
      } else {
        return const MobileLayoutHome();
      }
    });
  }
}
