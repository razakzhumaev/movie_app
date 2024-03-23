import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:star_wars_app/features/top_rated/data/model/top_rated_model.dart';
import 'package:star_wars_app/features/top_rated/domain/use_cases/top_rated_use_case.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';
part 'top_rated_event.dart';
part 'top_rated_state.dart';

@injectable
class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final TopRatedUseCase topRatedUseCase;

  TopRatedBloc({required this.topRatedUseCase})
      : super(TopRatedInitialState()) {
    on<TopRatedEvent>((event, emit) async {
      emit(TopRatedLoadingState());
      try {
        TopRatedResult result = await topRatedUseCase.getAllTopRatedrMovie();
        emit(TopRatedLoadedState(topRatedResult: result));
      } catch (e) {
        emit(TopRatedErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
