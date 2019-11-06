import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioUtil{

  baiduOnce() async {
    try{
      Response response = await Dio().get('http://www.baidu.com/');
      print(response);
      return response;
    }catch(err){
      print(err);
    }
  }

}

class MyDio extends StatefulWidget{

  final DioUtil dioUtil;

  MyDio({Key key, @required this.dioUtil}):super(key:key);

  @override
  State<StatefulWidget> createState() => _MyDio();
}

class _MyDio extends State<MyDio>{
  @override
  Widget build(BuildContext context) {

    String baiduTxt = "1368";

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio'),
      ),
      body: Column(
        children: <Widget>[

          Container(
              width: double.maxFinite,
              child: RaisedButton(onPressed:(){
                setState(() {
                  baiduTxt = widget.dioUtil.baiduOnce().toString();
                });
              },child: Text('百度一下'),)
          ),

        ],
      ),
    );
  }
}