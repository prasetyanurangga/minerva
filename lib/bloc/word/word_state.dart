import 'package:minerva/models/word_response_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WordState extends Equatable {
  const WordState();

  @override
  List<Object> get props => [];
}

class WordInitial extends WordState {}

class WordLoading extends WordState {}

class WordSuccess extends WordState {
  final List<Data> data;

  WordSuccess({@required this.data});
}
class WordFailure extends WordState {
  final String error;

  const WordFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'WordFailure { error: $error }';
}
