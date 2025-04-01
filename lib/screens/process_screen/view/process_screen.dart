import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  double progressScore = 0;
  bool hasStarted = false;
  bool isSendingResult = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Process screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    hasStarted
                        ? 'Please wait while the calculation is performed'
                        : 'All calculations has finished, you can send your results to server',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '${progressScore.round()}%',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  Divider(),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: progressScore / 100,
                      strokeWidth: 5,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 40,
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: isSendingResult ? null : () {},
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
          ],
        ),
      ),
    );
  }
}
