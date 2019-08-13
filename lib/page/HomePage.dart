import 'package:flutter/material.dart';
import './home/FollowsFragment.dart';
import './home/SearchPage.dart';
import './home/Search_page.dart';
import 'package:flutter_zhihu/global_config.dart';
import './home/Hot.dart';
class ArticlePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScaffoldRouteState();
  }
}

class _ScaffoldRouteState extends State<ArticlePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["关注", "推荐", "热榜"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.searchBackgroundColor,
        actions: <Widget>[
          Icon(
            Icons.list,
            color: Colors.black,
          )
        ],
        title: TextField(
          onTap: () => Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext context) {
            return new SearchPage();
          })),
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
//              contentPadding: const EdgeInsets.only(left:0.0,top:0.0,right:0.0,bottom:15.0),
              hintText: '请输入搜索内容...'),
          textDirection: TextDirection.ltr,
          textCapitalization: TextCapitalization.sentences,
        ),
        bottom: TabBar(
            //生成Tab菜单
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
//      drawer: new MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          if (e == '关注') {
            return new NotificationListener(child: FollowsListView());
          } else if (e == '推荐') {
            return new NotificationListener(child: FollowsListView());
          } else {
            return new NotificationListener(child: Hot());
          }
        }).toList(),
      ),
    );
  }
}
