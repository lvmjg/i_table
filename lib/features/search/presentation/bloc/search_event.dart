part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchInitiated extends SearchEvent {}

class SearchInputProvided extends SearchEvent {
  final String input;

  SearchInputProvided({required this.input});

  @override
  List<Object> get props => [input];
}
