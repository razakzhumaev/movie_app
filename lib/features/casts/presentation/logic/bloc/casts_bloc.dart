// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:star_wars_app/features/casts/data/model/casts_model.dart';
import 'package:star_wars_app/features/casts/domain/use_case/casts_repository_use_case.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';
part 'casts_event.dart';
part 'casts_state.dart';

@injectable
class CastsBloc extends Bloc<CastsEvent, CastsState> {
  final CastsRepositoryUseCase castsRepositoryUseCase;

  CastsBloc({required this.castsRepositoryUseCase})
      : super(CastsInitialState()) {
    on<GetAllCastsEvent>((event, emit) async {
      emit(CastsLoadingState());
      try {
        CastsResult result =
            await castsRepositoryUseCase.getMovieCastsById(event.id);
        emit(CastsLoadedState(castsResult: result));
      } catch (e) {
        emit(CastsErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
