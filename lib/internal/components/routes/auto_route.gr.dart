// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:flutter/material.dart' as _i12;
import 'package:star_wars_app/features/authorization/auth_screen.dart' as _i1;
import 'package:star_wars_app/features/authorization/splash/splash1_screen.dart'
    as _i5;
import 'package:star_wars_app/features/authorization/verify_email_screen.dart'
    as _i8;
import 'package:star_wars_app/features/now_playing/data/models/now_playing_model.dart'
    as _i11;
import 'package:star_wars_app/features/now_playing/presentation/screens/movie_screen.dart'
    as _i2;
import 'package:star_wars_app/features/now_playing/presentation/screens/now_playing_info_screen.dart'
    as _i3;
import 'package:star_wars_app/features/popular/data/model/popular_model.dart'
    as _i13;
import 'package:star_wars_app/features/popular/presentation/screens/popular_info_screen.dart'
    as _i4;
import 'package:star_wars_app/features/top_rated/data/model/top_rated_model.dart'
    as _i14;
import 'package:star_wars_app/features/top_rated/presentation/screens/top_rated_info_screen.dart'
    as _i6;
import 'package:star_wars_app/features/upcoming/data/model/upcoming_model.dart'
    as _i15;
import 'package:star_wars_app/features/upcoming/presentation/screens/upcoming_info_screen.dart'
    as _i7;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    MovieRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MovieScreen(),
      );
    },
    NowPlayingInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NowPlayingInfoRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.NowPlayingInfoScreen(
          key: args.key,
          nowPlayingModel: args.nowPlayingModel,
          id: args.id,
        ),
      );
    },
    PopularInfoRoute.name: (routeData) {
      final args = routeData.argsAs<PopularInfoRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.PopularInfoScreen(
          key: args.key,
          popularModel: args.popularModel,
          id: args.id,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
    TopRatedInfoRoute.name: (routeData) {
      final args = routeData.argsAs<TopRatedInfoRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.TopRatedInfoScreen(
          key: args.key,
          topRatedModel: args.topRatedModel,
          id: args.id,
        ),
      );
    },
    UpcomingInfoRoute.name: (routeData) {
      final args = routeData.argsAs<UpcomingInfoRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.UpcomingInfoScreen(
          key: args.key,
          upComingModel: args.upComingModel,
          id: args.id,
        ),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.VerifyEmailScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MovieScreen]
class MovieRoute extends _i9.PageRouteInfo<void> {
  const MovieRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MovieRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.NowPlayingInfoScreen]
class NowPlayingInfoRoute extends _i9.PageRouteInfo<NowPlayingInfoRouteArgs> {
  NowPlayingInfoRoute({
    _i10.Key? key,
    required _i11.NowPlayingModel nowPlayingModel,
    required int id,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          NowPlayingInfoRoute.name,
          args: NowPlayingInfoRouteArgs(
            key: key,
            nowPlayingModel: nowPlayingModel,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'NowPlayingInfoRoute';

  static const _i9.PageInfo<NowPlayingInfoRouteArgs> page =
      _i9.PageInfo<NowPlayingInfoRouteArgs>(name);
}

class NowPlayingInfoRouteArgs {
  const NowPlayingInfoRouteArgs({
    this.key,
    required this.nowPlayingModel,
    required this.id,
  });

  final _i10.Key? key;

  final _i11.NowPlayingModel nowPlayingModel;

  final int id;

  @override
  String toString() {
    return 'NowPlayingInfoRouteArgs{key: $key, nowPlayingModel: $nowPlayingModel, id: $id}';
  }
}

/// generated route for
/// [_i4.PopularInfoScreen]
class PopularInfoRoute extends _i9.PageRouteInfo<PopularInfoRouteArgs> {
  PopularInfoRoute({
    _i12.Key? key,
    required _i13.PopularModel popularModel,
    required int id,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          PopularInfoRoute.name,
          args: PopularInfoRouteArgs(
            key: key,
            popularModel: popularModel,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'PopularInfoRoute';

  static const _i9.PageInfo<PopularInfoRouteArgs> page =
      _i9.PageInfo<PopularInfoRouteArgs>(name);
}

class PopularInfoRouteArgs {
  const PopularInfoRouteArgs({
    this.key,
    required this.popularModel,
    required this.id,
  });

  final _i12.Key? key;

  final _i13.PopularModel popularModel;

  final int id;

  @override
  String toString() {
    return 'PopularInfoRouteArgs{key: $key, popularModel: $popularModel, id: $id}';
  }
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TopRatedInfoScreen]
class TopRatedInfoRoute extends _i9.PageRouteInfo<TopRatedInfoRouteArgs> {
  TopRatedInfoRoute({
    _i10.Key? key,
    required _i14.TopRatedModel topRatedModel,
    required int id,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          TopRatedInfoRoute.name,
          args: TopRatedInfoRouteArgs(
            key: key,
            topRatedModel: topRatedModel,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'TopRatedInfoRoute';

  static const _i9.PageInfo<TopRatedInfoRouteArgs> page =
      _i9.PageInfo<TopRatedInfoRouteArgs>(name);
}

class TopRatedInfoRouteArgs {
  const TopRatedInfoRouteArgs({
    this.key,
    required this.topRatedModel,
    required this.id,
  });

  final _i10.Key? key;

  final _i14.TopRatedModel topRatedModel;

  final int id;

  @override
  String toString() {
    return 'TopRatedInfoRouteArgs{key: $key, topRatedModel: $topRatedModel, id: $id}';
  }
}

/// generated route for
/// [_i7.UpcomingInfoScreen]
class UpcomingInfoRoute extends _i9.PageRouteInfo<UpcomingInfoRouteArgs> {
  UpcomingInfoRoute({
    _i12.Key? key,
    required _i15.UpComingModel upComingModel,
    required int id,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          UpcomingInfoRoute.name,
          args: UpcomingInfoRouteArgs(
            key: key,
            upComingModel: upComingModel,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UpcomingInfoRoute';

  static const _i9.PageInfo<UpcomingInfoRouteArgs> page =
      _i9.PageInfo<UpcomingInfoRouteArgs>(name);
}

class UpcomingInfoRouteArgs {
  const UpcomingInfoRouteArgs({
    this.key,
    required this.upComingModel,
    required this.id,
  });

  final _i12.Key? key;

  final _i15.UpComingModel upComingModel;

  final int id;

  @override
  String toString() {
    return 'UpcomingInfoRouteArgs{key: $key, upComingModel: $upComingModel, id: $id}';
  }
}

/// generated route for
/// [_i8.VerifyEmailScreen]
class VerifyEmailRoute extends _i9.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i9.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
