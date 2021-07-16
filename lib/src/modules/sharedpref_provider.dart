/*
 * Current preferences
 *
 * getRejectedGames (bool)
 * getCancelledGames (bool)
 * fetchRecentDuration (int)
 */

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefProvider with ChangeNotifier{
  SharedPreferences _pref;
  Logger logger;

  Future<void> setInstance() async {
    _pref = await SharedPreferences.getInstance();
    logger = Logger();
  }

  dynamic getPreferences(String prefName) {
    var result = _pref.get(prefName) ?? null;
    if(result == null)
      logger.e("Get from sharedPref failed!");
    else
      logger.i("Get from sharedPref succeed! value : " + result.toString());

    return result;
  }

  Future<bool> setPreferencesByInteger(String prefName, int input) async {
    return await _pref.setInt(prefName, input);
  }

  Future<bool> setPreferencesByString(String prefName, String input) async {
    return await _pref.setString(prefName, input);
  }

  Future<bool> setPreferencesByBoolean(String prefName, bool input) async {
    return await _pref.setBool(prefName, input);
  }
}