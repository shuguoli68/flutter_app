import 'package:flutter/material.dart';
import 'package:flutter_app/bean/zhuishu/book_catalog_entity.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter_app/util/HttpUtils.dart';

import '../../entity_factory.dart';

class BookCatalog extends StatefulWidget{
  String sId,title;
  BookCatalog({Key key, @required this.sId, @required this.title}):super(key:key);
  @override
  State<StatefulWidget> createState() => _BookCatalog();
}

class _BookCatalog extends State<BookCatalog>{

  BookCatalogEntity data;

  _getData () async {
    var result = await HttpUtils.request(
        '/mix-atoc/'+widget.sId,
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

  _body(){
    if(data==null || data.mixToc==null || data.mixToc.chapters.length<1){
      return Center(child: Text('数据为空'),);
    }else{
      return ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(5.0),
          itemExtent: 50,
          itemCount: data.mixToc.chapters.length,
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: Divider.createBorderSide(context,color: Colors.black12,width: 1)
                ),),
              child: ListTile(
                onTap: (){
                  myToast('点击了${data.mixToc.chapters[index].title}');
                },
                title: Text('${data.mixToc.chapters[index].title}'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
    );
  }
}