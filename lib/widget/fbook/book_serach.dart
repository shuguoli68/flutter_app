import 'package:dio/dio.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/zhuishu/book_search_entity.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter_app/util/HttpUtils.dart';
import 'package:search_widget/search_widget.dart';

import '../../entity_factory.dart';

class BookSearch extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BookSearch();
}

class _BookSearch extends State<BookSearch> {

  BookSearchEntity words;
  List<String> list = <String>[
    '元尊',
    '最强狂兵',
    '剑来',
    '超级女婿',
  ];

  _getWords(String keyword) async {
    if(keyword==null || keyword.isEmpty) return;
    var req = {
      'query':keyword
    };
    var response = await prefix0.Dio().get('http://api.zhuishushenqi.com/book/auto-complete',queryParameters: req);
//    var result = await HttpUtils.request(
//        'http://api.zhuishushenqi.com/book/auto-complete',
////        http://api.zhuishushenqi.com/book/auto-complete?query=%E6%96%97
//        method: HttpUtils.GET,
//        data: req
//    );
    setState(() {
      words = EntityFactory.generateOBJ(response.data);
      print('自动匹配：${words.keywords}');
      list = words.keywords;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16.0,
              ),
              SearchWidget<String>(
                dataList: list,
                hideSearchBoxWhenItemSelected: false,
                listContainerHeight: MediaQuery.of(context).size.height / 4,
                queryBuilder: (String query, List<String> list) {
                  print('input:$query');
                  _getWords(query);
                  return list.where((String item) => item.toLowerCase().contains(query.toLowerCase())).toList();
                },
                popupListItemBuilder: (String item) {
                  return PopupListItemWidget(item);
                },
                selectedItemBuilder: (String selectedItem, VoidCallback deleteSelectedItem) {
                  return SelectedItemWidget(selectedItem, deleteSelectedItem);
                },
                // widget customization
                noItemsFoundWidget: NoItemsFound(),
                textFieldBuilder: (TextEditingController controller, FocusNode focusNode) {
                  return MyTextField(controller, focusNode);
                },
              ),
            ],
          ),
        ),
      ),
    );
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

//搜索框
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  MyTextField(this.controller, this.focusNode);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: new TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x4437474F)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme
                .of(context)
                .primaryColor),
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "输入关键字...",
          contentPadding: EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
  }
}

////悬浮窗-没有自动补充匹配时
class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.folder_open,
            size: 24,
            color: Colors.grey[900].withOpacity(0.7),
          ),
          SizedBox(width: 10.0),
          Text(
            "No Items Found",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[900].withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

//悬浮窗-自动补充
class PopupListItemWidget extends StatelessWidget {
  final String item;

  PopupListItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        item,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}