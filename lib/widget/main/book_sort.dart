import 'package:flutter/material.dart';
import 'package:flutter_app/bean/zhuishu/book_sort_entity.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter_app/util/HttpUtils.dart';
import 'package:flutter_app/widget/fbook/book_sort_one.dart';
import 'package:flutter_tableview/flutter_tableview.dart';

class BookSort extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BookSort();
}

class _BookSort extends State<BookSort>{

  // 有多少个组
  int sectionCount = 4;
  int section = 0;
  int row = 0;

  int _index = 0;
  var list = List<BookSortItem>();
  BookSortEntity data;

  _getData () async {
    var result = await HttpUtils.request(
        '/cats/lv2',
        method: HttpUtils.GET,
        data: {
        }
    );
    data = EntityFactory.generateOBJ(result);
    setState(() {
      list.addAll(data.picture);
      sectionCount = list.length;
    });
  }

  _icon(int index){
    if (index == _index){
      return Icon(Icons.arrow_forward,);
    }else{
      return null;
    }
  }

  _click(int index){
    setState(() {
      _index =  index;
      switch(_index){
        case 1:
          list = data.male;
          break;
        case 2:
          list = data.female;
          break;
        case 3:
          list = data.press;
          break;
        default:
          list = data.picture;
          break;
      }
      sectionCount = list.length;
    });
  }

  String _getGender(int index){
    String title;
    switch(index){
      case 1:
        title = 'male';
        break;
      case 2:
        title = 'female';
        break;
      case 3:
        title = 'press';
        break;
      default:
        title = 'picture';
        break;
    }
    return title;
  }
  _title(int index){
    String title = '精选';
    switch(index){
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
    return ListTile(
      title: Text(title,style: TextStyle(color: Colors.black),),
      trailing:  _icon(index),
      onTap: (){
        _click(index);
      },
    );
  }

  // 每组有多少行（每组有多少个cell item）
  int _itemCount(int section) {
    if (_index == 1) {
      return data.male[section].mins.length;
    } else if (_index == 2) {
      return data.female[section].mins.length;
    } else if (_index == 3) {
      return data.press[section].mins.length;
    }else {
      return data.picture[section].mins.length;
    }
  }

  // 创建每组的header
  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    return InkWell(
      onTap: () {
        print('click section header. -> gender: ${_getGender(_index)},major: ${list[section].major}');
        goTo(context, BookSortOne(gender: _getGender(_index),major: list[section].major,minor: '',));
      },
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          child: ListTile(
            title: Text(list[section].major),
            trailing: Icon(Icons.keyboard_arrow_right),
            leading: Icon(Icons.list),
          ),
        ),),
    );
  }

  // 根据 section 和 row, 创建对应的item
  Widget _cellBuilder(BuildContext context, int section, int row) {
    if(list[section].mins==null || list[section].mins.length<1)
      return Center(child: Text('数据为空'),);
    return InkWell(
        onTap: () {
          this.section = section;
          this.row = row;
          print('click cell item. -> gender: ${_getGender(_index)},major: ${list[section].major},minor: ${list[section].mins[row]}');
          goTo(context, BookSortOne(gender: _getGender(_index),major: list[section].major,minor: list[section].mins[row],));
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.black,width: 1)
            ),
          ),
          child: ListTile(
            title: Text(list[section].mins[row]),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        )
    );
  }

  // section header widget 的高度
  double _sectionHeaderHeight(BuildContext context, int section) {
    return 60.0;
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
    print('BookSort');
    // TODO: implement build
    return Scaffold(
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[

          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                _title(0),
                _title(1),
                _title(2),
                _title(3),
              ],
            ),
          ),

          Expanded(
              flex:4,
              child: FlutterTableView(
                sectionCount: sectionCount,
                rowCountAtSection: _itemCount,
                sectionHeaderBuilder: _sectionHeaderBuilder,
                cellBuilder: _cellBuilder,
                sectionHeaderHeight: _sectionHeaderHeight,
                cellHeight: _cellHeight,
              ),
          ),

        ],
      ),
    );
  }
}