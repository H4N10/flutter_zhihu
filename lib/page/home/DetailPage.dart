import 'package:flutter/material.dart';
import 'package:flutter_zhihu/video/VideoPlayerHelper.dart';
class DetailsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailsState();
  }

}

class _DetailsState extends State<DetailsPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(

      body: new VideoApp(),
    );
  }


}