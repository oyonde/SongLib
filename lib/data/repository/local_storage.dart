import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/utils/constants/pref_constants.dart';

@singleton
abstract class LocalStorage {
  @factoryMethod
  factory LocalStorage(SharedPreferences localStorage) = LocalStorageImp;

  ThemeMode getThemeMode();

  Future<void> updateThemeMode(ThemeMode themeMode);

  bool getPrefBool(String settingsKey);
  int getPrefInt(String settingsKey);
  String getPrefString(String settingsKey);

  void setPrefBool(String settingsKey, bool settingsValue);
  void setPrefInt(String settingsKey, int settingsValue);
  void setPrefString(String settingsKey, String settingsValue);

  void clearData();
  void removeKeyPair(String settingsKey);
  bool keyExists(String settingsKey);
}

class LocalStorageImp implements LocalStorage {
  final SharedPreferences sharedPrefs;

  LocalStorageImp(this.sharedPrefs);

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await sharedPrefs.setString(
        PrefConstants.appearanceThemeKey, themeMode.toString());
  }

  @override
  ThemeMode getThemeMode() {
    final themeString =
        sharedPrefs.getString(PrefConstants.appearanceThemeKey);
    final theme = ThemeMode.values
        .firstWhere((element) => element.toString() == themeString);
    return theme;
  }

  @override
  void clearData() {
    sharedPrefs.remove(PrefConstants.isLoggedInKey);
    sharedPrefs.remove(PrefConstants.emailKey);
  }

  @override
  void removeKeyPair(String key) {
    sharedPrefs.remove(key);
  }

  @override
  bool keyExists(String key) {
    return sharedPrefs.containsKey(key);
  }

  @override
  bool getPrefBool(String settingsKey) {
    return sharedPrefs.getBool(settingsKey) ?? false;
  }

  @override
  int getPrefInt(String settingsKey) {
    return sharedPrefs.getInt(settingsKey) ?? 0;
  }

  @override
  String getPrefString(String settingsKey) {
    return sharedPrefs.getString(settingsKey) ?? '';
  }

  @override
  void setPrefBool(String settingsKey, bool settingsValue) {
    if (!settingsValue) {
      sharedPrefs.remove(settingsKey);
      return;
    }
    sharedPrefs.setBool(settingsKey, settingsValue);
  }

  @override
  void setPrefInt(String settingsKey, int settingsValue) {
    if (settingsValue.isNegative) {
      sharedPrefs.remove(settingsKey);
      return;
    }
    sharedPrefs.setInt(settingsKey, settingsValue);
  }

  @override
  void setPrefString(String settingsKey, String settingsValue) {
    if (settingsValue.isEmpty) {
      sharedPrefs.remove(settingsKey);
      return;
    }
    sharedPrefs.setString(settingsKey, settingsValue);
  }

}
