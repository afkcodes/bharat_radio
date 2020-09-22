import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  setString(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  setInt(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  setDouble(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  setBool(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  setStringList(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  getString(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringVal = prefs.get(key);
    return stringVal;
  }

  getInt(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int intVal = prefs.get(key);
    return intVal;
  }

  getDouble(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double doubleVal = prefs.get(key);
    return doubleVal;
  }

  getBool(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolVal = prefs.get(key);
    return boolVal;
  }

  getStringList(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List listVal = prefs.get(key);
    return listVal;
  }

  remove(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  clear() async {
    // Dangerous Don't use until too necessary will delete all data in shared prefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  ifExist(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkVal = prefs.containsKey(key);
    return checkVal;
  }

  setMap(key, val) async {
    String encodedMap = json.encode(val);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, encodedMap);
  }

  getMap(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map decodedMap = json.decode(prefs.get(key));
    return decodedMap;
  }
}
