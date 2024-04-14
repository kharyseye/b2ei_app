import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _userIdKey = 'user_id';
  static const String _supervisor = 'supervisor';

  Future<void> saveUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }

  Future<void> saveSupervisor(bool supervisor) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_supervisor, supervisor);
  }

  Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  Future<bool?> getSupervisor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_supervisor);
  }

  Future<void> logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_supervisor);
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }
}
