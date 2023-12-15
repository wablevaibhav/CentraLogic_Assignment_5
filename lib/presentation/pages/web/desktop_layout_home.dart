import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/feedback/feedback_bloc.dart';
import '../../bloc/feedback/feedback_event.dart';
import '../../bloc/feedback/feedback_state.dart';

class DesktopLayoutHome extends StatefulWidget {
  const DesktopLayoutHome({Key? key}) : super(key: key);

  @override
  State<DesktopLayoutHome> createState() => _DesktopLayoutHomeState();
}

class _DesktopLayoutHomeState extends State<DesktopLayoutHome> {
  final TextEditingController _textController = TextEditingController();
  List<String> submittedMessages = [];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome To CentraLogic!',
                      style: GoogleFonts.roboto(
                        color: const Color.fromRGBO(12, 15, 36, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Hi Charles!',
                      style: GoogleFonts.roboto(
                        color: const Color.fromRGBO(12, 15, 36, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 580,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 64,
                      height: 64,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'CentraLogic Bot',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      Text(
                        'Hi! I am CentraLogic Bot, your onboarding agent',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(233, 236, 244, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Today",
                        style: GoogleFonts.roboto(
                            color: const Color.fromRGBO(12, 15, 36, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  BlocBuilder<FeedbackBloc, FeedbackState>(
                    builder: (context, state) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 40, right: 40),
                        child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/logo.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            233, 236, 244, 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'Hi Welcome to CentraLogic Feedback Agent! Thank you for your interest in CentraLogic!',
                                        style: GoogleFonts.roboto(
                                            color: const Color.fromRGBO(
                                                12, 15, 36, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/logo.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            233, 236, 244, 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'What were the most valuable aspects of the Flutter training for you ?',
                                        style: GoogleFonts.roboto(
                                            color: const Color.fromRGBO(
                                                12, 15, 36, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.messages.length,
                                itemBuilder: (context, index) {
                                  return Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      // Adjust the vertical spacing as needed
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/logo.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  233, 236, 244, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              state.messages[index],
                                              style: GoogleFonts.roboto(
                                                color: const Color.fromRGBO(
                                                    12, 15, 36, 1),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: submittedMessages.length,
                                itemBuilder: (context, index) {
                                  return Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            233, 236, 244, 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        submittedMessages[index],
                                        style: GoogleFonts.roboto(
                                          color:
                                              const Color.fromRGBO(12, 15, 36, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),

                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
              width: width,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 900,
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'Type your step',
                          hintStyle: GoogleFonts.roboto(color: Colors.black),
                          prefixIcon: Image.asset('assets/attach.png'),
                          filled: true,
                          fillColor: const Color.fromRGBO(231, 231, 233, 1),
                          contentPadding: const EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Add some space between the TextField and the TextButton
                    SizedBox(
                      width: 80,
                      height: 45,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            submittedMessages.add(_textController.text);
                          });
                          // Ensure the input is not empty
                          if (_textController.text.isNotEmpty) {
                            final int step =
                                int.tryParse(_textController.text) ?? 0;

                            context
                                .read<FeedbackBloc>()
                                .add(FeedbackEvent(step: step));
                          }
                          _textController.clear();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(27, 72, 155, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: GoogleFonts.roboto(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
