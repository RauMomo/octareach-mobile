import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/repository/setting/setting_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final String TAG = "_ThemeStore";

// repository instance
  final SettingRepository _repository;

  // store for handling errors
  final ErrorStore errorStore;

  //scaffold key for showing
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // store variables:-----------------------------------------------------------
  @observable
  bool _darkMode = false;

  @observable
  int _currentTabIndex = 0;

  // getters:-------------------------------------------------------------------
  bool get darkMode => _darkMode;

  int get currentTabIndex => _currentTabIndex;

  // constructor:---------------------------------------------------------------
  _ThemeStore(this._repository, this.errorStore) {
    init();
  }

  // actions:-------------------------------------------------------------------
  @action
  Future changeBrightnessToDark(bool value) async {
    _darkMode = value;
    await _repository.changeBrightnessToDark(value);
  }

  void changeTabIndex(int index) {
    _currentTabIndex = index;
  }

  void resetTabIndex() {
    _currentTabIndex = 0;
  }

  // general methods:-----------------------------------------------------------
  Future init() async {
    _darkMode = _repository.isDarkMode;
  }

  bool isPlatformDark(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark;

  // dispose:-------------------------------------------------------------------
  @override
  dispose() {}
}
