import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/feedbackBot/presentation/bloc/feedback_bloc.dart';
import 'features/feedbackBot/presentation/pages/layout_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback Bot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: Colors.blue,
        ),
      ),
      home: BlocProvider(
        create: (context) => FeedbackBloc(),
        child: const LayoutHome(),
      ),
    );
  }
}
