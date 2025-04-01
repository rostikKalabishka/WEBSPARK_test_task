import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_task/blocs/process_bloc/process_bloc.dart';
import 'package:webspark_test_task/blocs/response_data_bloc/response_data_bloc.dart';
import 'package:webspark_test_task/blocs/send_result_bloc/send_result_bloc.dart';
import 'package:webspark_test_task/router/router.dart';

import 'repository/grid_repository/grid.dart';
import 'utils/helpers/algorithm/bfs.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();
  final GridRepository gridRepository = GridRepository();
  final PathFinder pathFinder = PathFinder();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => ResponseDataBloc(gridRepository: gridRepository)),
        BlocProvider(create: (_) => ProcessBloc(pathFinder: pathFinder)),
        BlocProvider(
            create: (_) => SendResultBloc(gridRepository: gridRepository))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'WEBSPARK test task',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: _router.config(),
      ),
    );
  }
}
