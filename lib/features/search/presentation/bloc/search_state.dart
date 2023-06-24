part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchFetchFailure extends SearchState {
  final String errorMessage;

  SearchFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SearchFetchInProgress extends SearchState {
  SearchFetchInProgress();

  @override
  List<Object> get props => [];
}

class SearchFetchSuccess extends SearchState {
  final List<SearchEntity> restaurants;

  SearchFetchSuccess({required this.restaurants});

  @override
  List<Object> get props => [restaurants];
}
