import 'package:bilheteria_panucci/models/movie.dart';
import 'package:bloc/bloc.dart';

import '../../services/movies_api.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeService homeService = HomeService();

  HomeCubit() : super(HomeInitial());

  Future<void> getMovies() async {
    try {
      emit(HomeLoading());
      await Future.delayed(const Duration(seconds: 2));
      final List<Movie> movies = await homeService.fetchMovies();
      emit(HomeSuccess(movies));
    } on Exception {
      emit(HomeError('Não foi possível carregar a lista de filmes'));
    }
  }

  Future<void> getMoviesByGenre(String genre) async {
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 2));

    try {
      final List<Movie> movies = await homeService.fetchMoviesByGenre(genre);
      if (movies.isEmpty) {
        emit(HomeError('Não existem filmes com esse gênero!'));
      } else {
        emit(HomeSuccess(movies));
      }
    } on Exception {
      emit(HomeError('Não foi possível carregar a lista de filmes'));
    }
  }
}
