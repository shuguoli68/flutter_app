import 'package:flutter/material.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';

class BookDetail extends StatefulWidget{
  String sId;//书籍id
  BookDetail({Key key, @required this.sId}):super(key:key);
  @override
  State<StatefulWidget> createState() => _BookDetail();
}

class _BookDetail extends State<BookDetail> {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('书籍详情'),
      ),

    );
  }
}