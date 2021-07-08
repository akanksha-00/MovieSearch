import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_internship/entities/movie.dart';
import 'package:movie_app_internship/presentation/search/bloc/movie_search_event.dart';
import 'package:movie_app_internship/presentation/search/bloc/movie_search_state.dart';
import 'package:movie_app_internship/respository/movie_search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  SearchBloc({required this.searchRepository}) : super(InitialState());

  late List<MovieEntity> movieList;
  bool isvalidYear = false;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SubmitEvent) {
      yield LoadingState();

      try {
        var year = int.parse(event.year.trim());
        if (event.year == "") {
          yield FailureState();
        } else {
          if (year > DateTime.now().year || year < 1885) {
            movieList = [];
          } else {
            Map<String, dynamic> raw =
                await searchRepository.getData(event.year);

            movieList = searchRepository.getList(raw);
          }

          yield SuccessState();
        }
      } on FormatException {
        isvalidYear = false;
        yield ErrorState();
      }
    } else if (event is TypeEvent) {
      try {
        var year = int.parse(event.textYear);
        isvalidYear = true;
        yield TypeState();
      } on FormatException {
        isvalidYear = false;
        yield ErrorState();
      }
    }
  }
}
