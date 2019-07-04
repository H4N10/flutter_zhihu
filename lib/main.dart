import 'package:flutter/material.dart';
import 'dart:developer';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _tabIndex = 0;
  var appBarTitles = ['首页', '商铺', '消息', '我的'];
  var tabImages ;
  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xff63ca6c)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xff888888)));
    }
  }
  Image getTabIcon(int curIndex) {
//    if (curIndex == _tabIndex) {
//      return tabImages[curIndex][1];
//    }
    return tabImages[curIndex][0];
  }
  /*
   * 根据image路径获取图片
   * 这个图片的路径需要在 pubspec.yaml 中去定义
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }
  void initData(){
    tabImages = [[getTabImage('assets/icon_main_logo.png')]];
  }

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    initData();
      return Scaffold(
        bottomNavigationBar:new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(title:getTabTitle(0), icon: getTabIcon(0)),
            new BottomNavigationBarItem(title:getTabTitle(1), icon: getTabIcon(0)),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      );

  }
}
