import 'package:dependencies/dependencies.dart'
    show CachedNetworkImage, DoubleExt, NumExt;
import 'package:flutter/material.dart';

import '../domain/entities/entities.dart' show Motel, Suite;
import 'home_controller.dart';
import 'home_state.dart';

part 'home_widgets.dart';

///
/// Home view
///
class HomeView extends StatefulWidget {
  /// Creates [HomeView]
  const HomeView({
    super.key,
    required this.homeController,
  });

  /// Home controller
  final HomeController homeController;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final controller = widget.homeController;

  @override
  void initState() {
    super.initState();
    controller.getMotelList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _AppBar(),
        body: ListenableBuilder(
          listenable: controller,
          builder: (context, child) => switch (controller.state) {
            HomeinitialState() => const _InitalView(),
            HomeLoadingState() => const _LoadingView(),
            HomeFailureState(:final message) => _ErrorView(text: message),
            HomeDoneState(:final motels) => _MotelList(motels: motels),
          },
        ),
      );
}
