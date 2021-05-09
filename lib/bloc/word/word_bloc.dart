import 'dart:async';

import 'package:minerva/bloc/word/word_event.dart';
import 'package:minerva/bloc/word/word_state.dart';
import 'package:minerva/models/word_response_model.dart';
import 'package:minerva/provider/response_data.dart';
import 'package:minerva/repository/word_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  WordRepository wordRepository = WordRepository();

  WordBloc() : super(WordInitial());

  @override
  WordState get initialState =>WordInitial();

  @override
  Stream<WordState> mapEventToState(WordEvent event) async* {
    if (event is GetRandomWord) { 
      yield WordLoading();
      try {
        final ResponseData<dynamic> response = await wordRepository.getRandomWord();

        var finalResponse = response.data;
        print(finalResponse);
        if (response.status == Status.ConnectivityError) {
          yield const WordFailure(error: "");
        }
        if (response.status == Status.Success) {
          yield WordSuccess(data: finalResponse as List<Data>);
        } else {
          yield WordFailure(error: response.message);
        }
      } catch (error) {
        print(error);
        yield WordFailure(error: error.toString());
      }
    }
  }
}