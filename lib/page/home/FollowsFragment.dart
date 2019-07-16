import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './DetailPage.dart';
import '../route/SlideRightRoute.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_zhihu/model/FollowsModel.dart';
import 'package:flutter_zhihu/model/MainModel.dart';
class FollowsListView extends StatefulWidget {
  @override
  _FollowsListViewState createState() => new _FollowsListViewState();
}

class _FollowsListViewState extends State<FollowsListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void goDetail() {
    Navigator.push(context, new SlideRightRoute(page: DetailsPage()));
  }

  Widget buildItems(String text) {
    return new GestureDetector(
      onTap: () {
        goDetail();
      },
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTitle("Flutter 为什么这么垃圾?"),
          Row(
            children: <Widget>[
              buildContent(''),
              new Flexible(
                  flex: 1,
                  child: Image.asset(
                'assets/article_pre.png',
                width: 80,
                height: 50,
              ))
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 16.0, right: 0.0, bottom: 5.0),
      child: new Text(
        "Flutter为什么这么垃圾?",
        textAlign: TextAlign.start,
        style: new TextStyle(fontSize: 18),
      ),
    );
  }

  Widget buildContent(String content) {
    return new Flexible(
      flex: 4,
      child: Padding(
          padding:
              EdgeInsets.only(left: 16.0, top: 0.0, right: 0.0, bottom: 0.0),
          child: new Text(
              "hello world hello world hello world hello world hello world hello world",
              textAlign: TextAlign.start,
              style: new TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _scrolly = 35;

    return ScopedModelDescendant<MainModel>(builder: (context,child,model){
      return  new NotificationListener(
          onNotification: (ScrollUpdateNotification note) {
            print(note.scrollDelta.toInt()); // 滚动位置。
            if (note.scrollDelta.toInt() > 0) {
              model.up(true);
            } else if (note.scrollDelta.toInt() != 0) {
              model.up(false);
            }
          },
          child: ListView.separated(
            itemCount: _words.length,
            itemBuilder: (context, index) {
              //如果到了表尾Ò
              if (_words[index] == loadingTag) {
                //不足100条，继续获取数据
                if (_words.length - 1 < 100) {
                  //获取数据
                  _retrieveData();
                  //加载时显示loading
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: CircularProgressIndicator(strokeWidth: 2.0)),
                  );
                } else {
                  //已经加载了100条数据，不再获取数据。
                  return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "没有更多了",
                        style: TextStyle(color: Colors.grey),
                      ));
                }
              }
              //显示单词列表项
              return buildItems(_words[index]);
//        return ListTile(title: Text(_words[index]));
            },
            separatorBuilder: (context, index) => Divider(height: .0),
          ));
    });
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}

//Item 布局

class ListNotification extends Notification {
  ListNotification(this.isUp);

  final bool isUp;
}
