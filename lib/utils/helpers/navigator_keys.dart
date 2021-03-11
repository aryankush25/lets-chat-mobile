import 'package:flutter/material.dart';

class NavigatorKeys {
  // Navigator Keys
  static GlobalKey<NavigatorState> _homeNavigatorKey =
      new GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> _chatsNavigatorKey =
      GlobalKey<NavigatorState>();

  // Navigator Keys Getters
  static GlobalKey<NavigatorState> get getHomeNavigatorKey => _homeNavigatorKey;
  static GlobalKey<NavigatorState> get getChatsNavigatorKey =>
      _chatsNavigatorKey;

  // Navigator Keys Current State Getters
  static NavigatorState get getHomeNavigatorKeyCurrentState =>
      _homeNavigatorKey.currentState;
  static NavigatorState get getChatsNavigatorKeyCurrentState =>
      _chatsNavigatorKey.currentState;
}
