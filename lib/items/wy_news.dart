import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/util/HttpUtils.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/bean/wy_news_entity.dart';

//https://www.apiopen.top/api.html

class WYNews extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _WYNews();
}

class _WYNews extends State<WYNews>{

  listMore(int page,int count) async {
    var result = await HttpUtils.request(
        'https://api.apiopen.top/getWangYiNews',
        method: HttpUtils.POST,
        data: {
          'page':page,
          'count':count
        }
    );
    print(result);
    WyNewsEntity bean =EntityFactory.generateOBJ(result);
    return bean;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('网易新闻'),
      ),
      body: Center(

      ),
    );
  }
}