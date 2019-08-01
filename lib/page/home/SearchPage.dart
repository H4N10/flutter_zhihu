import 'package:flutter/material.dart';
import 'package:flutter_zhihu/utils/SharedpreferencesUtils.dart';
import 'dart:developer';

class SearchWidge extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchState();
  }
}

class _SearchState extends State<SearchWidge>
    with SingleTickerProviderStateMixin {
  var searchHistory = List<String>();
  List tabs = ["热搜", "数码", "影视", "体育", "新知"];
  TabController _tabController; //需要定义一个Controller
  int groupValue = 1;

  List<Widget> Boxs() => List.generate(8,(index){
    return Column(children: <Widget>[
      new Text('海贼王891话'),
      new Text('大家都在看'),
    ],);
  });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    getHistory();
  }

  void getHistory() {
    readSharedListString('search').then((List<String> val) {
      if (val != null) {
        setState(() {
          searchHistory = val;
        });
      } else {
        searchHistory.clear();
      }
    });
  }

  void clearHistory() {
    removeShared('search').then((_) {
      setState(() {
        getHistory();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: TextField(
            onSubmitted: (String str) {
              searchHistory.add(str);
              setSpStringList('search', searchHistory);
              getHistory();
            },
            textInputAction: TextInputAction.search,
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
          )),
      body: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Row(
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Text(tabs[0]),
                  color: Color.fromARGB(158, 235, 235, 235),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(tabs[1]),
                  color: Color.fromARGB(158, 235, 235, 235),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(tabs[2]),
                  color: Color.fromARGB(158, 235, 235, 235),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(tabs[3]),
                  color: Color.fromARGB(158, 235, 235, 235),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),

              ],
            ),
          ),
          new Container(
            padding: EdgeInsets.fromLTRB(5,10, 10, 15),
            child: Wrap(
              spacing:100,
              runSpacing: 10,
              children: Boxs(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  '搜索历史',
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                    onTap: clearHistory,
                    child: new Text(
                      '清空记录',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 15),
                    ))
              ],
            ),
          ),
          new Expanded(
              child: new ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: new Text(
                        searchHistory[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return new Container(
                      height: 1.0,
                      color: Colors.grey,
                    );
                  },
                  itemCount: searchHistory == null ? 0 : searchHistory.length))
        ],
      ),
    );
  }
}
