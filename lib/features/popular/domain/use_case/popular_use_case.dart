import 'package:star_wars_app/features/popular/data/model/popular_model.dart';
import 'package:star_wars_app/features/popular/domain/repository/popular_repository.dart';

class PopularUseCase {
  final PopularRepository popularRepository;

  PopularUseCase({required this.popularRepository});

  Future<PopularResult> getPopularMovie() async {
    return await popularRepository.getPopularMovie();
  }
}
