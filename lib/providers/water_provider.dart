import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaterProvider extends ChangeNotifier {
  int _currentIntake = 0;
  int _dailyGoal = 2000;
  
  static const String _keyIntake = 'current_intake';
  static const String _keyGoal = 'daily_goal';
  static const String _keyLastReset = 'last_reset_time';

  WaterProvider() {
    _loadData();
  }

  int get currentIntake => _currentIntake;
  int get dailyGoal => _dailyGoal;
  
  double get progress => (_currentIntake / _dailyGoal).clamp(0.0, 1.0);

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _currentIntake = prefs.getInt(_keyIntake) ?? 0;
    _dailyGoal = prefs.getInt(_keyGoal) ?? 2000;
    
    int? lastResetMillis = prefs.getInt(_keyLastReset);
    _checkDailyReset(lastResetMillis, prefs);
    
    notifyListeners();
  }
  
  Future<void> _checkDailyReset(int? lastResetMillis, SharedPreferences prefs) async {
    final now = DateTime.now();
    
    if (lastResetMillis == null) {
      // First run ever, save today
      await prefs.setInt(_keyLastReset, now.millisecondsSinceEpoch);
      return;
    }

    final lastReset = DateTime.fromMillisecondsSinceEpoch(lastResetMillis);
    
    // Check if it's a different day, month, or year
    if (lastReset.day != now.day || lastReset.month != now.month || lastReset.year != now.year) {
      _currentIntake = 0;
      await prefs.setInt(_keyIntake, 0);
      await prefs.setInt(_keyLastReset, now.millisecondsSinceEpoch);
    }
  }

  Future<void> addWater(int amount) async {
    _currentIntake += amount;
    notifyListeners();
    _saveData();
  }

  Future<void> updateGoal(int newGoal) async {
    _dailyGoal = newGoal;
    notifyListeners();
    _saveData();
  }
  
  Future<void> reset() async {
    _currentIntake = 0;
    notifyListeners();
    _saveData();
  }
  
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyIntake, _currentIntake);
    await prefs.setInt(_keyGoal, _dailyGoal);
  }
}
