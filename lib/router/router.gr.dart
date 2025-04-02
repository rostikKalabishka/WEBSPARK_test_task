// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [PreviewScreen]
class PreviewRoute extends PageRouteInfo<PreviewRouteArgs> {
  PreviewRoute({
    Key? key,
    required ResultModel resultModel,
    required int index,
    List<PageRouteInfo>? children,
  }) : super(
         PreviewRoute.name,
         args: PreviewRouteArgs(
           key: key,
           resultModel: resultModel,
           index: index,
         ),
         initialChildren: children,
       );

  static const String name = 'PreviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreviewRouteArgs>();
      return PreviewScreen(
        key: args.key,
        resultModel: args.resultModel,
        index: args.index,
      );
    },
  );
}

class PreviewRouteArgs {
  const PreviewRouteArgs({
    this.key,
    required this.resultModel,
    required this.index,
  });

  final Key? key;

  final ResultModel resultModel;

  final int index;

  @override
  String toString() {
    return 'PreviewRouteArgs{key: $key, resultModel: $resultModel, index: $index}';
  }
}

/// generated route for
/// [ProcessScreen]
class ProcessRoute extends PageRouteInfo<void> {
  const ProcessRoute({List<PageRouteInfo>? children})
    : super(ProcessRoute.name, initialChildren: children);

  static const String name = 'ProcessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProcessScreen();
    },
  );
}

/// generated route for
/// [ResultListScreen]
class ResultListRoute extends PageRouteInfo<ResultListRouteArgs> {
  ResultListRoute({
    Key? key,
    required List<SendResultModel> results,
    List<PageRouteInfo>? children,
  }) : super(
         ResultListRoute.name,
         args: ResultListRouteArgs(key: key, results: results),
         initialChildren: children,
       );

  static const String name = 'ResultListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResultListRouteArgs>();
      return ResultListScreen(key: args.key, results: args.results);
    },
  );
}

class ResultListRouteArgs {
  const ResultListRouteArgs({this.key, required this.results});

  final Key? key;

  final List<SendResultModel> results;

  @override
  String toString() {
    return 'ResultListRouteArgs{key: $key, results: $results}';
  }
}
