import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';

class Common {
  static Widget searchInput(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new FlatButton.icon(
                onPressed: null,
                icon: new Icon(Icons.arrow_back, color: GlobalConfig.fontColor),
                label: new Text("")),
            width: 60,
          ),
          new Expanded(
            child: new TextField(
              decoration: new InputDecoration.collapsed(
                  hintText: "搜索知乎内容...",
                  hintStyle: new TextStyle(color: GlobalConfig.fontColor)),
            ),
          ),
          new Container(
            child: new IconButton(
                icon: new Icon(Icons.share, color: GlobalConfig.fontColor),
                onPressed: () {},
                padding: const EdgeInsets.all(0.0),
                iconSize: 18.0),
          )
        ],
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        theme: GlobalConfig.themeData,
        home: new Scaffold(
          appBar: new AppBar(
            title: Common.searchInput(context),
          ),
          body: new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new FlatButton(
                    onPressed: null,
                    child: new Container(
                        child: new Text(
                      "有哪些让你细思恐极的事件？",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          height: 1.4,
                          color: GlobalConfig.dark == true
                              ? Colors.white70
                              : Colors.black),
                    )),
                    color: GlobalConfig.cardBackgroundColor,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  decoration: new BoxDecoration(
                    color: GlobalConfig.cardBackgroundColor,
                  ),
                ),
                new Container(
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                            flex: 1,
                            child: new Container(
                              decoration: new BoxDecoration(
                                  border: new BorderDirectional(
                                      end: new BorderSide(
                                          color: Colors.white10))),
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: new FlatButton.icon(
                                onPressed: () {},
                                icon: new Icon(Icons.brush),
                                label: new Text(
                                  "写回答",
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                textTheme: ButtonTextTheme.accent,
                              ),
                            )),
                        new Expanded(
                            flex: 1,
                            child: new Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: new FlatButton(
                                  onPressed: null,
                                  child: new Text(
                                    "查看全部1000条回答 >",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: GlobalConfig.dark == true
                                            ? Colors.white70
                                            : Colors.black),
                                  ),
                                )))
                      ],
                    ),
                    decoration: new BoxDecoration(
                      color: GlobalConfig.cardBackgroundColor,
                    ),
                    margin: new EdgeInsets.only(bottom: 10.0)),
                new Container(
                  decoration: new BoxDecoration(
                    color: GlobalConfig.cardBackgroundColor,
                  ),
                  child: new ListTile(
                    leading: new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            "https://pic3.zhimg.com/v2-cd467bb9bb31d0384f065cf0bd677930_xl.jpg"),
                        radius: 20.0),
                    title: new Text("张三"),
                    subtitle: new Text("我就叫张三"),
                    trailing: new RaisedButton.icon(
                        onPressed: () {},
                        icon: new Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: new Text("关注",
                            style: new TextStyle(color: Colors.white)),
                        color: Colors.blue),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.all(16.0),
                  child: new Text(
                      "我有一个大约在12.3年前因为我的听力让我们一家三口幸存，大白天我和我妈在家当时我妈还怀着我妹妹，然后因为我妈在做饭我在餐桌上坐着，当时离门很近，我听到有人在上楼 \n\n（我们家是六楼顶层，因为小时候每次爸爸回来走楼梯的声音我都能听出来，但这一次声音不一样很陌生）\n\n 我就很冷静的站在门口听着脚步声在我门口停住。 \n\n（当时的门是外面一个铁门里面一个木头门那种很老的小区那种门，感觉一根方便面就能撬开那种，关键之前扔垃圾的时候没有关铁门，只关了木门）\n\n然后就听到门锁有铁丝的声音，顿时我就用手按住里面的门把手用脚顶住门交，我妈还一脸懵逼的问我干什么，我说外面有人，我妈还以为是我爸回来了，就问外面是谁，然后外面的人一直不说话，我和我妈顿时紧张起来，我妈还拿着刀出来准备着不测，毕竟我妈当时怀孕我也才不到10岁 \n\n 主要问他不说话他也不走，辛亏老天保佑楼下来人了，听着声音2.3个男人上楼是对面邻居的人，然后我就听着这个男的走了，然后我还一直顶着门，我妈去次卧窗户看楼下是什么人，最后我妈说看见一个穿着黑衣服的男的出来。当时真的很后怕，如果我没在家或者我没有听见，真的我感觉细思极恐，然后过了段时间我们家就换了防盗门。 \n\n 现在想想有时候真佩服自己那敏感的神经质",
                      style: new TextStyle(
                          height: 1.4,
                          fontSize: 16.0,
                          color: GlobalConfig.fontColor),
                      textAlign: TextAlign.start),
                )
              ],
            ),
          ),
          bottomNavigationBar: new BottomAppBar(
            child: new Container(height: 50.0,child: new Row(children: <Widget>[
              new Container(
                child: new FlatButton.icon(onPressed: (){}, label: new Text("赞同 10 K"), color: GlobalConfig.searchBackgroundColor, icon: new Icon(Icons.arrow_drop_up),),
                margin: new EdgeInsets.only(left: 16.0),
                height: 30.0,
              ),
              new Container(
                child: new IconButton(onPressed: (){}, icon: new Icon(Icons.arrow_drop_down),padding: const EdgeInsets.all(0.0)),
                margin: new EdgeInsets.only(left: 8.0),
                height: 30.0,
                decoration: new BoxDecoration(
                  borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
                  color: GlobalConfig.searchBackgroundColor,
                ),
              ),
              new Expanded(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                          onPressed: (){ print("icon");},
                          icon: new Container(
                            child: new Column(
                              children: <Widget>[
                                new Icon(Icons.favorite, size: 18.0, color: GlobalConfig.fontColor,),
                                new Text("感谢", style: new TextStyle(fontSize: 10.0, color: GlobalConfig.fontColor),)
                              ],
                            ),
                            margin: const EdgeInsets.only(),
                            height: 30.0,
                          )
                      ),
                      new IconButton(
                          onPressed: (){ print("icon");},
                          icon: new Container(
                            child: new Column(
                              children: <Widget>[
                                new Icon(Icons.star, size: 18.0, color: GlobalConfig.fontColor,),
                                new Text("收藏", style: new TextStyle(fontSize: 10.0, color: GlobalConfig.fontColor),)
                              ],
                            ),
                            margin: const EdgeInsets.only(),
                            height: 30.0,
                          )
                      ),
                      new IconButton(
                          onPressed: (){ print("icon");},
                          icon: new Container(
                            child: new Column(
                              children: <Widget>[
                                new Icon(Icons.mode_comment, size: 18.0, color: GlobalConfig.fontColor,),
                                new Text("345", style: new TextStyle(fontSize: 10.0, color: GlobalConfig.fontColor),)
                              ],
                            ),
                            margin: const EdgeInsets.only(),
                            height: 30.0,
                          )
                      ),
                    ],
                  )
              )
            ],),),
          ),
        ));
  }
}
