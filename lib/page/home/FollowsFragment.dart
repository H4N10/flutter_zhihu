import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './DetailPage.dart';
import '../route/SlideRightRoute.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_zhihu/model/FollowsModel.dart';
import 'package:flutter_zhihu/model/MainModel.dart';
import 'package:flutter_zhihu/global_config.dart';

import 'Detail_page.dart';

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
    Navigator.push(context, new SlideRightRoute(page: new DetailPage()));
  }

  Widget buildItems(String text) {
    return new Container(
      color: GlobalConfig.cardBackgroundColor,
      child: new GestureDetector(
        onTap: () {
          goDetail();
        },
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTitle("聊聊 Android 的打包..."),
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
            new Container(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text('30' + " 赞同 · " + '17' + "评论",
                          style: new TextStyle(color: GlobalConfig.fontColor))),
                  new PopupMenuButton(
                      icon: new Icon(
                        Icons.linear_scale,
                        color: GlobalConfig.fontColor,
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<String>>[
                            new PopupMenuItem<String>(
                                value: '选项一的值', child: new Text('屏蔽这个问题')),
                            new PopupMenuItem<String>(
                                value: '选项二的值',
                                child: new Text('取消关注 learner')),
                            new PopupMenuItem<String>(
                                value: '选项二的值', child: new Text("举报"))
                          ])
                ],
              ),
              padding: EdgeInsets.only(
                  left: 16.0, top: 0.0, right: 0.0, bottom: 5.0),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 16.0, right: 0.0, bottom: 5.0),
      child: new Text(
        title,
        textAlign: TextAlign.start,
        style: new TextStyle(fontSize: 18,color:  GlobalConfig.fontColor),
      ),
    );
  }

  Widget buildContent(String content) {
    return new Flexible(
      flex: 4,
      child: Container(
          color: GlobalConfig.cardBackgroundColor,
          padding:
              EdgeInsets.only(left: 16.0, top: 0.0, right: 0.0, bottom: 0.0),
          child: new Text(
              "我们现在大部分开发都是基于 Android Studio 进行的，在 AS 中，我们只需要点击 Run 按钮，AS 自动会打包 Apk 安装至设备中并运行" +
                  "。对于我们来说，其中的打包过程就是一个黑盒，我们所知道的就是 Sources -> AS Compiler -> APK。这篇文章我们就分析一下中间的打包过程，以及打包相关的一些问题。",
              textAlign: TextAlign.start,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _scrolly = 35;

    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      return new NotificationListener(
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
