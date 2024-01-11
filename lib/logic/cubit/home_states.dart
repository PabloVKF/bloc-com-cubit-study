part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
  final List<Movie> movies;

  HomeSuccess(this.movies);
}

class HomeError extends HomeStates {
  final String error;

  HomeError(this.error);
}