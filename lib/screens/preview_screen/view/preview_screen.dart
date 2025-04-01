import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../repository/grid_repository/model/models.dart';

@RoutePage()
class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, required this.resultModel});
  final ResultModel resultModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
