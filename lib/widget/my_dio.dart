import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/util/HttpUtils.dart';
import 'package:flutter_app/items/wy_news.dart';

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

  duanzi() async{
    var result = await HttpUtils.request(
      'https://api.apiopen.top/getJoke',
      method: HttpUtils.GET,
      data: {
        'page':1,
        'count':1,
        'type':'video'
      }
    );
    print(result);
    return result;
  }
}

class MyDio extends StatefulWidget{

  final DioUtil dioUtil;

  MyDio({Key key, @required this.dioUtil}):super(key:key);

  @override
  State<StatefulWidget> createState() => _MyDio();
}

class _MyDio extends State<MyDio>{

  _goTo(Widget key){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return key;
    }));
  }

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

          Container(
              width: double.maxFinite,
              child: RaisedButton(onPressed:(){
                widget.dioUtil.duanzi();
              },child: Text('新实时段子'),)
          ),

          Container(
              width: double.maxFinite,
              child: RaisedButton(onPressed:(){
                _goTo(WYNews());
              },child: Text('网易新闻'),)
          ),


        ],
      ),
    );
  }
}