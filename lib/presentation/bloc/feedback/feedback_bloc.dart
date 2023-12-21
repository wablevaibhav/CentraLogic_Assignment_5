import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'feedback_event.dart';
import 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackState(step: 0, messages: [])) {
    on<FeedbackEvent>(_onFetchQuestion);
  }

  void _onFetchQuestion(
      FeedbackEvent event, Emitter<FeedbackState> emit) async {
    try {
      final response = await http.post(
        Uri.parse(
            "https://sapdos-api.azurewebsites.net/api/Credentials/FeedbackJoiningBot"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"step": event.step}),
      );

      if (response.statusCode != 200) {
        if (kDebugMode) {
          print("Failed to fetch question. Status Code: ${response.statusCode}");
        }
        return;
      }

      final String nonJsonResponse = response.body;
      const String messageStart = '"message": "';
      const String messageEnd = '"';

      final int startIndex = nonJsonResponse.indexOf(messageStart);
      final int endIndex = nonJsonResponse.indexOf(
          messageEnd, startIndex + messageStart.length);

      if (startIndex != -1 && endIndex != -1) {
        final String message = nonJsonResponse.substring(
            startIndex + messageStart.length, endIndex);

        emit(FeedbackState(
          step: event.step + 1,
          messages: [...state.messages, message],
        ));
      } else {
        if (kDebugMode) {
          print("Unexpected non-JSON response format: $nonJsonResponse");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error during API request: $e");
      }
    }
  }
}
