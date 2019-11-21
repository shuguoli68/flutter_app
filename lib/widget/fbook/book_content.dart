import 'package:flutter/material.dart';
import 'package:flutter_app/bean/zhuishu/book_content_entity.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter_app/util/HttpUtils.dart';

import '../../entity_factory.dart';

class BookContent extends StatefulWidget{

  String link,title;
  BookContent({Key key, @required this.link, @required this.title}):super(key:key);
  @override
  State<StatefulWidget> createState() => _BookContent();
}

class _BookContent extends State<BookContent> {

  BookContentEntity data;

  _getData () async {
    var result = await HttpUtils.request(
        'http://chapter2.zhuishushenqi.com/chapter/'+widget.link,
        method: HttpUtils.GET,
        data: {
        }
    );
    setState(() {
      data = EntityFactory.generateOBJ(result);
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(data.chapter.cpContent),
        ),
      ),
    );
  }
}