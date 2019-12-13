import 'package:dio/dio.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/zhuishu/book_query_entity.dart';
import 'package:flutter_app/bean/zhuishu/book_search_entity.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter_app/util/HttpUtils.dart';

import '../../entity_factory.dart';
import 'book_detail.dart';

class BookSearch extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BookSearch();
}

class _BookSearch extends State<BookSearch> {

  BookSearchEntity words;
  BookQueryEntity data;
  List<BookQueryBook> books = new List<BookQueryBook>();
  List<String> hintList = <String>[
    '元尊',
    '最强狂兵',
    '剑来',
    '超级女婿',
  ];
  String input = '';
  bool hintOrResult = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: Flex(direction: Axis.vertical, children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextField(
                  onChanged: (input){
                    this.input = input;
                    _getWords(input);
                  },
                  decoration: InputDecoration(
                    hintText: '输入关键字',
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.search,color: Colors.blue,), onPressed: (){
                _getQuery(input);
              }),
            ],
          ),

          Expanded(child: _bodyList())
        ],
        ),
      ),
    );
  }

  _bodyList() {
    if(hintOrResult){//显示搜索结果
      return ListView.separated(
        separatorBuilder: (context,index){
          return Container(height: 1,color: Colors.green,);
        },
        itemCount: books.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              goTo(context, BookDetail(sId: books[index].sId,));
            },
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Image.network(HttpUtils.BASE_URL_IMG+books[index].cover,width: 50,height: 90,),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text('《'+books[index].title+'》-'+books[index].author,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(books[index].shortIntro,maxLines: 3,overflow: TextOverflow.ellipsis),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }else{//显示自动补充提示
      return ListView.separated(
          separatorBuilder: (context,index){
            return Container(height: 1,color: Colors.green,);
            },
          itemCount: hintList.length,
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                _getQuery(hintList[index]);
              },
              title: Text(hintList[index],),
              trailing: Icon(Icons.keyboard_arrow_right)
            );
          },
      );
    }
  }

  _getWords(String keyword) async {
    if(keyword==null || keyword.isEmpty) return;
    var req = {
      'query':keyword
    };
    var response = await prefix0.Dio().get('http://api.zhuishushenqi.com/book/auto-complete',queryParameters: req);
//    var result = await HttpUtils.request(
//        '/book/auto-complete',
//        method: HttpUtils.GET,
//        data: {
//          'query':keyword
//        }
//    );
    setState(() {
      hintOrResult = false;
      words = EntityFactory.generateOBJ(response.data);
      print('自动匹配：${words.keywords}');
      hintList = words.keywords;
    });
  }

  _getQuery(String keyword) async {
    if(keyword==null || keyword.isEmpty) {
      myToast( '请先输入关键字');
      return;
    }
    var req = {
      'query':keyword,
      'start':1,
      'limit':50
    };
    var response = await prefix0.Dio().get('http://api.zhuishushenqi.com/book/fuzzy-search',queryParameters: req);
    print('结果response：$response');
//    var result = await HttpUtils.request(
//        '/book/fuzzy-search',
//        method: HttpUtils.GET,
//        data: {
//          'query':keyword,
//          'start':1,
//          'limit':50
//        }
//    );
    setState(() {
      hintOrResult = true;
      data = EntityFactory.generateOBJ(response.data);
      books = data.books;
    });
  }
}

//搜索结果
class SelectedItemWidget extends StatelessWidget {
  final String selectedItem;
  final VoidCallback deleteSelectedItem;

  SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 4.0,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                selectedItem,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedItem,
          ),
        ],
      ),
    );
  }
}
