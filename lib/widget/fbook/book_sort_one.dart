import 'package:flutter_app/bean/zhuishu/book_category_entity.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/HttpUtils.dart';

import '../../entity_factory.dart';

class BookSortOne extends StatefulWidget{
  String gender,major;//大分类、主分类
  BookSortOne({Key key, @required this.gender,@required this.major}):super(key:key);
  @override
  State<StatefulWidget> createState() => _BookSortOne();
}

class _BookSortOne extends State<BookSortOne>{

  String type = 'hot';//类型："hot"、"over"、"new"
  String minor = '';//子分类：
  int start = 0;
  int limit = 20;

  BookCategoryEntity data;
  var list = List<BookCategoryBook>();

  _getData () async {
    var result = await HttpUtils.request(
        '/book/by-categories',
        method: HttpUtils.GET,
        data: {
          'gender':widget.gender,
          'type':type,
          'major':widget.major,
          'minor':minor,
          'start':start,
          'limit':limit
        }
    );
    data = EntityFactory.generateOBJ(result);
    setState(() {
      list.addAll(data.books);
    });
  }

  _BuildItem(BuildContext context, int index){
    if(list.isEmpty) return Center(child: Text('数据为空'));
    return GestureDetector(
        onTap: (){
          Toast.show('点击了$index', context,gravity: Toast.TOP);
        },
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  image: DecorationImage(image: NetworkImage(list[index].cover),fit: BoxFit.cover)
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(list[index].title+'-'+list[index].author,maxLines: 1,overflow: TextOverflow.ellipsis),
                  Text(list[index].shortIntro,maxLines: 3,overflow: TextOverflow.ellipsis),
                ],
              ),
            )
          ],
        ),
    );
  }


  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.major),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return _BuildItem(context, index);
          },
          separatorBuilder: (context,index){
            return Container(height: 1,color: Colors.green,);
          },
          itemCount: list.length),
    );
  }
}