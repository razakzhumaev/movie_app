import 'package:injectable/injectable.dart';
import 'package:star_wars_app/features/top_rated/data/model/top_rated_model.dart';
import 'package:star_wars_app/features/top_rated/domain/repository/top_rated_repository.dart';

@injectable
class TopRatedUseCase {
  final TopRatedRepository topRatedRepository;

  TopRatedUseCase({required this.topRatedRepository});

  Future<TopRatedResult> getAllTopRatedrMovie() async =>
      await topRatedRepository.getAllTopRatedrMovie();
}
