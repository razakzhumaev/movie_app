import 'package:auto_route/auto_route.dart';
import 'package:star_wars_app/internal/components/routes/auto_route.gr.dart';

// part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(page: MovieRoute.page),
        AutoRoute(page: UpcomingInfoRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: VerifyEmailRoute.page),
        AutoRoute(page: NowPlayingInfoRoute.page),
        AutoRoute(page: PopularInfoRoute.page),
        AutoRoute(page: TopRatedInfoRoute.page),
      ];
}
