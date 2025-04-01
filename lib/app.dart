import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_task/blocs/response_data_bloc/response_data_bloc.dart';
import 'package:webspark_test_task/router/router.dart';

import 'repository/grid_repository/grid.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();
  final GridRepository gridRepository = GridRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResponseDataBloc(gridRepository: gridRepository),
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
