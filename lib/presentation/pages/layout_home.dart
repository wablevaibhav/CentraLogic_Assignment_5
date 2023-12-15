import 'package:feedback_bot/presentation/bloc/feedback/feedback_bloc.dart';
import 'package:feedback_bot/presentation/pages/mobile/mobile_layout_home.dart';
import 'package:feedback_bot/presentation/pages/web/desktop_layout_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutHome extends StatelessWidget {
  const LayoutHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return BlocProvider(
              create: (context) => FeedbackBloc(),
              child: const DesktopLayoutHome());
        } else {
          return BlocProvider(
              create: (context) => FeedbackBloc(),
              child: const MobileLayoutHome());
        }
        }

    );
  }
}
