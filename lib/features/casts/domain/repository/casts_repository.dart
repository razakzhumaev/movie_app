import 'package:star_wars_app/features/casts/data/model/casts_model.dart';

abstract class CastsRepository {
  Future<CastsResult> getMovieCastsById(int id);
}
