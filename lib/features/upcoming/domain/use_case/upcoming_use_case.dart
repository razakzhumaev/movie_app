// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:star_wars_app/features/upcoming/data/model/upcoming_model.dart';
import 'package:star_wars_app/features/upcoming/domain/repository/upcomint_repository.dart';


@injectable
class UpComingUseCase {
  UpComingRepository upComingRepository;
  UpComingUseCase({required this.upComingRepository});

  Future<UpComingResult> getAllUpComingMovies() async =>
      await upComingRepository.getAllUpComingMovies();
}
