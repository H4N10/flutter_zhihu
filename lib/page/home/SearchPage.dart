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

class _SearchState extends State<SearchWidge> {
  var searchHistory = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistory();
  }

  void getHistory() {

    readSharedListString('search').then((List<String> val) {
      if(val!=null){
        searchHistory = val;
      }
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
              print(str);
              searchHistory.add(str);
              setSpStringList('search', searchHistory);
              setState(() {
                getHistory();
              });
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
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: <Widget>[
                new Text(
                  '搜索历史',
                  style: TextStyle(fontSize: 16),
                ),
                new Text(
                  '清空记录',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15),
                )
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
                  itemCount: searchHistory==null?0:searchHistory.length))
        ],
      ),
    );
  }
}
