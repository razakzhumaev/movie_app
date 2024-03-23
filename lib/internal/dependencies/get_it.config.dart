// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/casts/data/repository/casts_repository_impl.dart' as _i4;
import '../../features/casts/domain/repository/casts_repository.dart' as _i3;
import '../../features/casts/domain/use_case/casts_repository_use_case.dart'
    as _i5;
import '../../features/casts/presentation/logic/bloc/casts_bloc.dart' as _i19;
import '../../features/now_playing/data/repository/now_playing_repository_impl.dart'
    as _i7;
import '../../features/now_playing/domain/repository/now_playing_repository.dart'
    as _i6;
import '../../features/now_playing/domain/use_case/now_playing_use_case.dart'
    as _i8;
import '../../features/now_playing/presentation/logic/bloc/now_playing_bloc.dart'
    as _i20;
import '../../features/popular/data/repository/popular_repository_impl.dart'
    as _i10;
import '../../features/popular/domain/repository/popular_repository.dart'
    as _i9;
import '../../features/popular/domain/use_case/popular_use_case.dart' as _i11;
import '../../features/popular/presentation/logic/bloc/popular_bloc.dart'
    as _i21;
import '../../features/top_rated/data/repository/top_rated_repository_impl.dart'
    as _i13;
import '../../features/top_rated/domain/repository/top_rated_repository.dart'
    as _i12;
import '../../features/top_rated/domain/use_cases/top_rated_use_case.dart'
    as _i14;
import '../../features/top_rated/presentation/logic/bloc/top_rated_bloc.dart'
    as _i22;
import '../../features/upcoming/data/repository/upcoming_repository_impl.dart'
    as _i16;
import '../../features/upcoming/domain/repository/upcomint_repository.dart'
    as _i15;
import '../../features/upcoming/domain/use_case/upcoming_use_case.dart' as _i17;
import '../../features/upcoming/presentation/logic/bloc/upcoming_bloc.dart'
    as _i18;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.CastsRepository>(() => _i4.NowPlayingRepositoryImpl());
  gh.factory<_i5.CastsRepositoryUseCase>(() =>
      _i5.CastsRepositoryUseCase(castsRepository: gh<_i3.CastsRepository>()));
  gh.factory<_i6.NowPlayingRepository>(() => _i7.NowPlayingRepositoryImpl());
  gh.factory<_i8.NowPlayingUseCase>(() => _i8.NowPlayingUseCase(
      nowPlayingRepository: gh<_i6.NowPlayingRepository>()));
  gh.factory<_i9.PopularRepository>(() => _i10.PopularRepositoryImpl());
  gh.factory<_i11.PopularUseCase>(() =>
      _i11.PopularUseCase(popularRepository: gh<_i9.PopularRepository>()));
  gh.factory<_i12.TopRatedRepository>(() => _i13.TopRatedRepostoryImpl());
  gh.factory<_i14.TopRatedUseCase>(() =>
      _i14.TopRatedUseCase(topRatedRepository: gh<_i12.TopRatedRepository>()));
  gh.factory<_i15.UpComingRepository>(() => _i16.UpComingRepositoryImpl());
  gh.factory<_i17.UpComingUseCase>(() =>
      _i17.UpComingUseCase(upComingRepository: gh<_i15.UpComingRepository>()));
  gh.factory<_i18.UpcomingBloc>(
      () => _i18.UpcomingBloc(upComingUseCase: gh<_i17.UpComingUseCase>()));
  gh.factory<_i19.CastsBloc>(() =>
      _i19.CastsBloc(castsRepositoryUseCase: gh<_i5.CastsRepositoryUseCase>()));
  gh.factory<_i20.NowPlayingBloc>(() =>
      _i20.NowPlayingBloc(nowPlayingUseCase: gh<_i8.NowPlayingUseCase>()));
  gh.factory<_i21.PopularBloc>(
      () => _i21.PopularBloc(popularUseCase: gh<_i11.PopularUseCase>()));
  gh.factory<_i22.TopRatedBloc>(
      () => _i22.TopRatedBloc(topRatedUseCase: gh<_i14.TopRatedUseCase>()));
  return getIt;
}
