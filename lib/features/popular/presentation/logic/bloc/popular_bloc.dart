import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:star_wars_app/features/popular/data/model/popular_model.dart';
import 'package:star_wars_app/features/popular/domain/use_case/popular_use_case.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';
part 'popular_event.dart';
part 'popular_state.dart';


@injectable
class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final PopularUseCase popularUseCase;
  PopularBloc({required this.popularUseCase}) : super(PopularInitialState()) {
    on<GetAllPopularMovieEvent>((event, emit) async {
      emit(PopularLoadingState());

      try {
        PopularResult result = await popularUseCase.getPopularMovie();
        emit(PopularLoadedState(popularResult: result));
      } catch (e) {
        emit(PopularErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
