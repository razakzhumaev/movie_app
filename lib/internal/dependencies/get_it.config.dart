// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/now_playing/data/repository/now_playing_repository_impl.dart'
    as _i4;
import '../../features/now_playing/domain/repository/now_playing_repository.dart'
    as _i3;
import '../../features/now_playing/domain/use_case/now_playing_use_case.dart' as _i5;
import '../../features/now_playing/presentation/logic/bloc/now_playing_bloc.dart'
    as _i9;
import '../../features/popular/data/repository/popular_repository_impl.dart'
    as _i7;
import '../../features/popular/domain/repository/popular_repository.dart'
    as _i6;
import '../../features/popular/domain/use_case/popular_use_case.dart' as _i8;
import '../../features/popular/presentation/logic/bloc/popular_bloc.dart'
    as _i10;

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
  gh.factory<_i3.NowPlayingRepository>(() => _i4.NowPlayingRepositoryImpl());
  gh.factory<_i5.NowPlayingUseCase>(() => _i5.NowPlayingUseCase(
      nowPlayingRepository: gh<_i3.NowPlayingRepository>()));
  gh.factory<_i6.PopularRepository>(() => _i7.PopularRepositoryImpl());
  gh.factory<_i8.PopularUseCase>(
      () => _i8.PopularUseCase(popularRepository: gh<_i6.PopularRepository>()));
  gh.factory<_i9.NowPlayingBloc>(
      () => _i9.NowPlayingBloc(nowPlayingUseCase: gh<_i5.NowPlayingUseCase>()));
  gh.factory<_i10.PopularBloc>(
      () => _i10.PopularBloc(popularUseCase: gh<_i8.PopularUseCase>()));
  return getIt;
}
