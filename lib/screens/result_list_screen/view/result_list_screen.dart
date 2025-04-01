import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webspark_test_task/repository/grid_repository/model/send_result_model.dart';
import 'package:webspark_test_task/router/router.dart';

@RoutePage()
class ResultListScreen extends StatelessWidget {
  const ResultListScreen({super.key, required this.results});

  final List<SendResultModel> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result List Screen'),
      ),
      body: results.isNotEmpty
          ? ListView.separated(
              itemCount: results.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  results[index].result.path,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  AutoRouter.of(context)
                      .push(PreviewRoute(resultModel: results[index].result));
                },
              ),
            )
          : const Center(
              child: Text('Something went wrong...'),
            ),
    );
  }
}
