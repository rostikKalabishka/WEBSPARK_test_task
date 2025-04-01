import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../repository/grid_repository/model/models.dart';
import '../screens/home_screen/view.dart';
import '../screens/preview_screen/view.dart';
import '../screens/process_screen/view.dart';
import '../screens/result_list_screen/view.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: ProcessRoute.page,
          path: '/process_screen',
        ),
        AutoRoute(
          page: ResultListRoute.page,
          path: '/process_screen/result_list_screen',
        ),
        AutoRoute(
          page: PreviewRoute.page,
          path: '/process_screen/result_list_screen/preview_screen',
        ),
      ];
}
