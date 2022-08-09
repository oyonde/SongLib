import 'package:songlib/repository/tour_repository.dart';
import 'package:songlib/util/save/save_util.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainMenuVm with ChangeNotifierEx {
  late final MainMenuNavigator _navigator;
  final TourRepository _tourRepository;

  bool get hasGameAvailable => SaveUtil.hasCyclingView;

  MainMenuVm(
    this._tourRepository,
  );

  Future<void> init(MainMenuNavigator navigator) async {
    _navigator = navigator;
  }

  Future<void> onContinueClick() async {
    await _navigator.goToGame();
    notifyListeners();
  }

  Future<void> onCareerClicked() async {
    await _navigator.goToCareerOverview();
    notifyListeners();
  }

  Future<void> onSingleRaceClicked() async {
    await _navigator.goToSingleRaceMenu();
    notifyListeners();
  }

  Future<void> onTourClicked() async {
    if (_tourRepository.playSettings == null) {
      await _navigator.goToTourSelect();
    } else {
      await _navigator.goToTourInProgress();
    }
    notifyListeners();
  }

  void onSettingsPressed() => _navigator.goToSettings();

  void onInfoPressed() => _navigator.goToInfo();

  void onCreditsPressed() => _navigator.goToCredits();
}

mixin MainMenuNavigator {
  Future<void> goToTourSelect();

  Future<void> goToGame();

  Future<void> goToCareerOverview();

  Future<void> goToTourInProgress();

  Future<void> goToSingleRaceMenu();

  void goToSettings();

  void goToInfo();

  void goToCredits();
}
