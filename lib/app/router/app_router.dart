import 'package:auto_route/auto_route.dart';
import 'package:main_character/views/chart/chart_page.dart';
import 'package:main_character/views/home/home_page.dart';
import 'package:main_character/views/main/main_page.dart';
import 'package:main_character/views/profile/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
        ),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ChartRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ];
}
