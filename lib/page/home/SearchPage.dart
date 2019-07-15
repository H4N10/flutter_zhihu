import 'package:flutter/material.dart';

class SearchWidge extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchState();
  }

}

class _SearchState extends State<SearchWidge>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('搜索'),),
    );
  }

}