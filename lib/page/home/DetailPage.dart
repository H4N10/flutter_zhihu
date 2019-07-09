import 'package:flutter/material.dart';

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

      body: SafeArea(
          child: RaisedButton(
              child: Text("Detail"),
              onPressed: () {
              })),
    );
  }

}