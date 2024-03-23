import 'package:injectable/injectable.dart';
import 'package:star_wars_app/features/casts/data/model/casts_model.dart';
import 'package:star_wars_app/features/casts/domain/repository/casts_repository.dart';

@injectable
class CastsRepositoryUseCase {
  final CastsRepository castsRepository;

  CastsRepositoryUseCase({required this.castsRepository});

  Future<CastsResult> getMovieCastsById(int id) async =>
      await castsRepository.getMovieCastsById(id);
}
