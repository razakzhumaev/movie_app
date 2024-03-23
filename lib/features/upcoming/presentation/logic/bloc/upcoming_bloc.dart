// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:star_wars_app/features/upcoming/data/model/upcoming_model.dart';
import 'package:star_wars_app/features/upcoming/domain/use_case/upcoming_use_case.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

@injectable
class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpComingUseCase upComingUseCase;
  UpcomingBloc({required this.upComingUseCase})
      : super(UpcomingInitialState()) {
    on<GetAllUpComingMoviesEvent>((event, emit) async {
      emit(UpcomingLoadingState());
      try {
        UpComingResult result = await upComingUseCase.getAllUpComingMovies();
        emit(UpcomingLoadedState(upComingResult: result));
      } catch (e) {
        emit(UpcomingErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
