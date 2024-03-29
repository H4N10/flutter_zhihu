import 'package:flutter/material.dart';
import './page/HomePage.dart';
import './page/MinePage.dart';
import './page/NotifyPage.dart';
import './page/VipPage.dart';
import './page/home/FollowsFragment.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/FollowsModel.dart';
import 'model/MainModel.dart';
import 'dart:developer';
import 'package:flutter_zhihu/global_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: GlobalConfig.themeData,
      title: 'Flutter Demo',
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
  bool isup = true;
  var appBarTitles = ['首页', '会员', '消息', '我的'];
  var tabImages;
  var _bodys;
  AnimatedContainer _container;
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
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 根据image路径获取图片
   * 这个图片的路径需要在 pubspec.yaml 中去定义
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  void initData() {
    tabImages = [
      [
        getTabImage('assets/article.png'),
        getTabImage('assets/article_press.png')
      ],
      [getTabImage('assets/vip.png'), getTabImage('assets/vip_press.png')],
      [
        getTabImage('assets/notify.png'),
        getTabImage('assets/notify_press.png')
      ],
      [getTabImage('assets/mine.png'), getTabImage('assets/mine_press.png')]
    ];
    _bodys = [
      new ArticlePage(),
      new VipPage(),
      new NotifyPage(),
      new MinePage()
    ];
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  MainModel followsModel = MainModel();
  @override
  Widget build(BuildContext context) {
    initData();
    initState(){
    }
    return ScopedModel<MainModel>(
      model: followsModel,
      child: Scaffold(
        body: _bodys[_tabIndex],
        bottomNavigationBar: ScopedModelDescendant<MainModel>(builder: (context,child,model){
          return new Offstage(
            offstage: model.isUp,
            child: new BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                new BottomNavigationBarItem(
                    title: getTabTitle(0), icon: getTabIcon(0)),
                new BottomNavigationBarItem(
                    title: getTabTitle(1), icon: getTabIcon(1)),
                new BottomNavigationBarItem(
                    title: getTabTitle(2), icon: getTabIcon(2)),
                new BottomNavigationBarItem(
                    title: getTabTitle(3), icon: getTabIcon(3)),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: _tabIndex,
              onTap: (index) {
                setState(() {
                  _tabIndex = index;
                });
              },
            ),
          );
        }),
      ),
    );
  }
}
