import 'package:flutter/material.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';

class BookRankOne extends StatefulWidget{
  String id,title;//大分类、主分类
  BookRankOne({Key key, @required this.id,@required this.title}):super(key:key);
  @override
  State<StatefulWidget> createState() => _BookRankOne();
}

class _BookRankOne extends State<BookRankOne> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}