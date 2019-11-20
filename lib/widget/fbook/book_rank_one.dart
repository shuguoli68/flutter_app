import 'package:flutter/material.dart';
import 'package:flutter_app/bean/zhuishu/book_rank_one_entity.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter_app/util/HttpUtils.dart';
import 'package:loadmore/loadmore.dart';

import '../../entity_factory.dart';
import 'book_detail.dart';

class BookRankOne extends StatefulWidget{
  String id,title;//大分类、主分类
  BookRankOne({Key key, @required this.id,@required this.title}):super(key:key);
  @override
  State<StatefulWidget> createState() => _BookRankOne();
}

class _BookRankOne extends State<BookRankOne> {

  BookRankOneEntity data;
  var list = List<BookRankOneRankingBook>();


  _getData () async {
    var result = await HttpUtils.request(
        '/ranking/'+widget.id,
        method: HttpUtils.GET,
        data: {

        }
    );
    data = EntityFactory.generateOBJ(result);
    setState(() {
      list.addAll(data.ranking.books);
    });
  }

  _BuildItem(BuildContext context, int index){
    return GestureDetector(
      onTap: (){
        goTo(context, BookDetail(sId: list[index].sId,));
      },
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Image.network(HttpUtils.BASE_URL_IMG+list[index].cover,width: 50,height: 90,),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text('《'+list[index].title+'》-'+list[index].author,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),
                Text(/*'        '+*/list[index].shortIntro,maxLines: 3,overflow: TextOverflow.ellipsis),
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

  _body(){
    if(list.isEmpty){
      return Center(child: Text('数据为空'));
    }else{
      return ListView.separated(
          itemBuilder: (context, index){
            return _BuildItem(context, index);
          },
          separatorBuilder: (context,index){
            return Container(height: 1,color: Colors.green,);
          },
          itemCount: list.length
      );
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