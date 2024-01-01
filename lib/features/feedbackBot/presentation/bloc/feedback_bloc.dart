import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'feedback_event.dart';
import 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final Dio _dio = Dio();

  FeedbackBloc() : super(const FeedbackState(step: 0, messages: [])) {
    on<FeedbackEvent>(_onFetchQuestion);
  }

  void _onFetchQuestion(
      FeedbackEvent event, Emitter<FeedbackState> emit) async {
    try {
      final response = await _dio.post(
        "https://sapdos-api-v2.azurewebsites.net/api/Credentials/FeedbackJoiningBot",
        data: {"step": event.step},
      );

      if (response.statusCode != 200) {
        if (kDebugMode) {
          print("Failed to fetch question. Status Code: ${response.statusCode}");
        }
        return;
      }

      final dynamic jsonContent = json.decode(response.data);
      final message = jsonContent['message'].toString();

      emit(FeedbackState(
        step: event.step + 1,
        messages: [...state.messages, message],
      ));

    } catch (e) {
      if (kDebugMode) {
        print("Error during API request: $e");
      }
    }
  }





}
