import 'package:flutter/material.dart';
import 'package:flutter_app/bean/zhuishu/book_rank_entity.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter_app/util/HttpUtils.dart';
import 'package:flutter_app/widget/fbook/book_rank_one.dart';
import 'package:flutter_tableview/flutter_tableview.dart';

import '../../entity_factory.dart';

class BookRank extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BookRank();
}

class _BookRank extends State<BookRank>{

  BookRankEntity data;

  // 有多少个组
  int sectionCount = 4;
  int section = 0;
  int row = 0;

  _getData () async {
    var result = await HttpUtils.request(
        '/ranking/gender',
        method: HttpUtils.GET,
        data: {
        }
    );
    setState(() {
      data = EntityFactory.generateOBJ(result);
    });
  }

  // 每组有多少行（每组有多少个cell item）
  int _itemCount(int section) {
    if (section == 1) {
      return data.male.length;
    } else if (section == 2) {
      return data.female.length;
    } else if (section == 3) {
      return data.epub.length;
    }else {
      return data.picture.length;
    }
  }

  List<BookRankItem> _itemOne(int section) {
    if (section == 1) {
      return data.male;
    } else if (section == 2) {
      return data.female;
    } else if (section == 3) {
      return data.epub;
    }else {
      return data.picture;
    }
  }


  // 创建每组的header
  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    String title;
    switch(section){
      case 1:
        title = '男生';
        break;
      case 2:
        title = '女生';
        break;
      case 3:
        title = '出版';
        break;
      default:
        title = '精选';
        break;
    }
    return InkWell(
      onTap: () {
        print('click section header. -> section:$section');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0),
        color: Color.fromRGBO(220, 220, 220, 1),
        height: 100,
        child: Text(title),
      ),
    );
  }

  // 根据 section 和 row, 创建对应的item
  Widget _cellBuilder(BuildContext context, int section, int row) {
    return InkWell(
      onTap: () {
        this.section = section;
        this.row = row;
        print('click cell item. -> section:$section row:$row');
        goTo(context, BookRankOne(id:_itemOne(section)[row].sId,title:_itemOne(section)[row].title,));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: Divider.createBorderSide(context,color: Colors.black,width: 1)
          ),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(5.0),
              child: ClipOval(
                child: Image.network(_itemOne(section)[row].cover,height: 30,width: 30,fit: BoxFit.fitHeight,),
              ),
            ),
            Expanded(child: Text(_itemOne(section)[row].title,maxLines: 1,overflow: TextOverflow.ellipsis),)
          ],
        ),
      )
    );
  }

  // section header widget 的高度
  double _sectionHeaderHeight(BuildContext context, int section) {
    return 30.0;
  }

  // cell item widget 的高度
  double _cellHeight(BuildContext context, int section, int row) {
    return 60.0;
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //FlutterTableView
      child: FlutterTableView(
        sectionCount: sectionCount,
        rowCountAtSection: _itemCount,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        cellBuilder: _cellBuilder,
        sectionHeaderHeight: _sectionHeaderHeight,
        cellHeight: _cellHeight,
      ),
    );
  }
}