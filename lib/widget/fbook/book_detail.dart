import 'package:flutter/material.dart';
import 'package:flutter_app/bean/zhuishu/book_recommend_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_detail_entity.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter_app/util/HttpUtils.dart';

import '../../entity_factory.dart';
import 'book_catalog.dart';

class BookDetail extends StatefulWidget{
  String sId;//书籍id
  BookDetail({Key key, @required this.sId}):super(key:key);
  @override
  State<StatefulWidget> createState() => _BookDetail();
}

class _BookDetail extends State<BookDetail> {

  BookDetailEntity book;//本书的详情
  BookRecommendEntity data;//推荐书籍
  var list = List<Book>();//推荐书籍列表

  _getData () async {
    var result = await HttpUtils.request(
        '/book/'+widget.sId,
        method: HttpUtils.GET,
        data: {

        }
    );
    setState(() {
      book = EntityFactory.generateOBJ(result);
    });

    var response = await HttpUtils.request(
        '/book/'+widget.sId+'/recommend',
        method: HttpUtils.GET,
        data: {

        }
    );
    setState(() {
      data = EntityFactory.generateOBJ(response);
      list = data.books;
    });
  }

  _bottomBtn(int index){
    String str;
    if(index == 0){
      str = '加入书架';
    }else if(index == 1){
      str = '立即阅读';
    }else{
      str = '全部下载';
    }
    return MaterialButton(
      color: Colors.green,
      textColor: Colors.white,
      child: Text(str),
      onPressed: (){
        Toast.show(str, context,gravity: Toast.TOP);
        switch(index){
          case 0://加入书架
            break;
          case 1://立即阅读
            break;
          default://全部下载
            break;
        }
      },
    );
  }

  //类似书籍 推荐
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
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('书籍详情'),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          //中间
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(5.0),child: Image.network(HttpUtils.BASE_URL_IMG+book.cover,width: 80,height: 120,),),
                    Expanded(child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 10.0,left: 10.0),child: Text(book.title),),
                        Padding(padding: EdgeInsets.only(top: 10.0,left: 10.0),child: Text(book.title+'    |    '+book.majorCate+'-'+book.minorCate),),
                        Padding(padding: EdgeInsets.only(top: 10.0,left: 10.0),child: Text(numStr(book.wordCount)),),
                      ],
                    )),
                  ],
                ),
                Padding(padding: EdgeInsets.all(5.0)),

                Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: <Widget>[
                  Text(book.rating.score.toString()+'分\n评分'),
                  Text(numStr(book.latelyFollower)+'\n近期热度'),
                  Text(numStr(book.totalFollower)+'分\n读者'),
                ],),
                Container(width: double.infinity, height: 1.0, color: Colors.black12,),
                Padding(padding: EdgeInsets.all(5.0)),

                Padding(padding: EdgeInsets.all(5.0),child: Text(book.longIntro,),),

                Container(width: double.infinity, height: 1.0, color: Colors.black12,),
                ListTile(
                  onTap: (){
                    goTo(context, BookCatalog(sId: book.sId,title: book.title,));
                  },
                  title: Text('更新至        '+book.lastChapter,),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                Container(width: double.infinity, height: 15.0, color: Colors.black12,),

                Padding(padding: EdgeInsets.all(5.0),child: Text('类似书籍推荐：'),),
                _body(),
              ],
            ),
          )),
          //底部按钮
          Padding(
            padding: EdgeInsets.only(bottom: 10.0,top: 5.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
              _bottomBtn(0),
              _bottomBtn(1),
              _bottomBtn(2),
            ],),
          ),

        ],
      ),
    );
  }
}