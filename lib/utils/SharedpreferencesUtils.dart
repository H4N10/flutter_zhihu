import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

/*
   * 存储数据
   */
Future setSpString(String key,String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(key, value);
  print('存储:$value');
}
Future setSpBool(String key,bool value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool(key, value);
  print('存储:$value');
}
Future setSpDouble(String key,double value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setDouble(key, value);
  print('存储:$value');
}
Future setSpInt(String key,int value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt(key, value);
  print('存储:$value');
}
Future setSpStringList(String key,List<String> value) async {
  debugger();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setStringList(key, value);
  print('存储:$value');
}

/*
   * 读取数据
   */
Future<String> readSharedString(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String value = preferences.getString(key);
  print('读取到acount为:$value');
  return value;
}
Future<bool> readSharedBool(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool value = preferences.getBool(key);
  print('读取到acount为:$value');
  return value;
}
Future<double> readSharedDouble(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  double value = preferences.getDouble(key);
  print('读取到acount为:$value');
  return value;
}
Future<int> readSharedInt(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int value = preferences.getInt(key);
  print('读取到acount为:$value');
  return value;
}
Future<List<String>> readSharedListString(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String> value = preferences.getStringList(key);
  print('读取到acount为:$value');
  return value;
}
/*
   * 删除数据
   */
Future removeShared(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove(key);
  print('删除acount成功');
}
