import 'package:flutter/material.dart';

class NavigatorKeys {
  // Navigator Keys
  static GlobalKey<NavigatorState> _homeNavigatorKey =
      new GlobalKey<NavigatorState>();

  // Navigator Keys Getters
  static GlobalKey<NavigatorState> get getHomeNavigatorKey => _homeNavigatorKey;

  // Navigator Keys Current State Getters
  static NavigatorState get getHomeNavigatorKeyCurrentState =>
      _homeNavigatorKey.currentState;
}
