import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:star_wars_app/features/now_playing/data/models/now_playing_model.dart';
import 'package:star_wars_app/features/now_playing/domain/use_case/now_playing_use_case.dart';
import 'package:star_wars_app/features/now_playing/presentation/logic/bloc/now_playing_state.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';
part 'now_playing_event.dart';

@injectable
class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final NowPlayingUseCase nowPlayingUseCase;

  NowPlayingBloc({required this.nowPlayingUseCase})
      : super(NowPlayingInitialState()) {
    on<GetAllNowPlayingEvent>((event, emit) async {
      emit(NowPlayingLoadingState());

      try {
        NowPlayingResult result = await nowPlayingUseCase.getNowPlayingMovie();

        emit(NowPlayingLoadedState(nowPlayingResult: result));
      } catch (e) {
        emit(NowPlayingErrorState(error: CatchException.convertException(e)));
      }
    });

  
  }
}
