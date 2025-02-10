import 'package:dependencies/dependencies.dart' show ResultExt;
import 'package:flutter/material.dart' show ChangeNotifier;

import '../domain/usecases/get_motel_list_usecase.dart';
import 'home_state.dart';

///
/// Home controller
///
class HomeController extends ChangeNotifier {
  /// Creates [HomeController]
  HomeController(this._getMotelListUsecase);

  final IGetMotelListUsecase _getMotelListUsecase;

  HomeState _state = HomeinitialState();

  /// Get actual state
  HomeState get state => _state;

  /// Get motel list method
  Future<void> getMotelList() async {
    _state = HomeLoadingState();
    notifyListeners();

    final result = await _getMotelListUsecase();

    _state = result.fold(
      (failure) => HomeFailureState(message: failure.message),
      (success) => HomeDoneState(motels: success),
    );

    notifyListeners();
  }
}
