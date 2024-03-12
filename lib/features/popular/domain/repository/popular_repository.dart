import 'package:star_wars_app/features/popular/data/model/popular_model.dart';

abstract class PopularRepository {
  Future<PopularResult> getPopularMovie();
}
