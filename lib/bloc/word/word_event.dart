import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WordEvent extends Equatable {
  const WordEvent();
  @override
  List<Object> get props => [];
}

class GetRandomWord extends WordEvent {
  GetRandomWord();
}