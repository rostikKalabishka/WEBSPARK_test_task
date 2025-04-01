import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_task/blocs/send_result_bloc/send_result_bloc.dart';
import 'package:webspark_test_task/blocs/process_bloc/process_bloc.dart';
import 'package:webspark_test_task/blocs/process_bloc/process_state.dart';
import 'package:webspark_test_task/blocs/response_data_bloc/response_data_bloc.dart';
import 'package:webspark_test_task/repository/grid_repository/model/models.dart';
import 'package:webspark_test_task/router/router.dart';

@RoutePage()
class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  bool hasStarted = false;
  bool isSendingResult = false;
  List<SendResultModel> pathResults = [];

  @override
  void initState() {
    var state = context.read<ResponseDataBloc>().state as ResponseDataSuccess;
    context.read<ProcessBloc>().add(StartProcess(state.responseData));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Process screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocConsumer<ProcessBloc, ProcessState>(
              listener: (context, state) {
                log('Отримано стан: $state');
                if (state is ProcessInProgress) {
                  setState(() {
                    hasStarted = true;
                  });
                }
                if (state is ProcessFinished) {
                  setState(() {
                    hasStarted = false;
                  });
                }
                if (state is ProcessFailure) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Помилка: ${state.error}')),
                    );
                  });
                }
              },
              builder: (context, state) {
                if (state is ProcessFinished) {
                  pathResults = state.pathResults;
                }

                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hasStarted
                            ? 'Please wait while the calculation is performed'
                            : 'All calculations have finished, you can send your results to server',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '${state.progress.round()}%',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Divider(),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          value: state.progress / 100,
                          strokeWidth: 5,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                );
              },
            ),
            if (!hasStarted)
              BlocListener<SendResultBloc, SendResultState>(
                listener: (context, state) {
                  if (state is SendResultLoading) {
                    setState(() {
                      isSendingResult = true;
                    });
                  }
                  if (state is SendResultSuccess) {
                    setState(() {
                      isSendingResult = false;
                    });
                    AutoRouter.of(context)
                        .push(ResultListRoute(results: pathResults));
                  }
                  if (state is SendResultFailure) {
                    setState(() {
                      isSendingResult = false;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Something went wrong...'),
                      ),
                    );
                  }
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: isSendingResult
                          ? null
                          : () {
                              context.read<SendResultBloc>().add(
                                    SendResultDataEvent(pathResults),
                                  );
                            },
                      child: isSendingResult
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text('Send results to server'),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
