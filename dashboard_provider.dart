import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  // Example state variable
  String _dashboardTitle = "Agriculture Dashboard";

  // Getter
  String get dashboardTitle => _dashboardTitle;

  // Example method to update state
  void updateTitle(String newTitle) {
    _dashboardTitle = newTitle;
    notifyListeners(); // Notify UI about state change
  }
}
