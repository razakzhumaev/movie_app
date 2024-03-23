import 'package:star_wars_app/features/upcoming/data/model/upcoming_model.dart';

abstract class UpComingRepository {
  Future<UpComingResult> getAllUpComingMovies();
}
