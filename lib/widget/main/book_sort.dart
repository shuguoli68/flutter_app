import 'package:flutter/material.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter_app/bean/zhuishu/book_sort_entity.dart';
import 'package:flutter_app/util/HttpUtils.dart';
import 'package:flutter_app/widget/fbook/book_sort_one.dart';

class BookSort extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BookSort();
}

class _BookSort extends State<BookSort>{

  int _index = 0;
  var list = List<BookSortItem>();
  BookSortEntity data;

  _getData () async {
    var result = await HttpUtils.request(
        '/cats/lv2/statistics',
        method: HttpUtils.GET,
        data: {
        }
    );
    data = EntityFactory.generateOBJ(result);
    setState(() {
      list.addAll(data.picture);
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
    });
  }

  String _getGender(int index){
    String title;
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
    return title;
  }
  _title(int index){
    String title = '精选';
    title = _getGender(index);
    return ListTile(
      title: Text(title,style: TextStyle(color: Colors.black),),
      trailing:  _icon(index),
      onTap: (){
        _click(index);
      },
    );
  }

  _getItem(BookSortItem item){
    return GestureDetector(
      onTap: (){
        myToast(context, item.name);
        goTo(context, BookSortOne(gender:_getGender(_index),major:item.name));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2,),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Text(item.name),
            ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Text('月：${item.monthlyCount}'),
            ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Text('总：${item.bookCount}'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getWidgetList(){
    if(list.isEmpty){
      return [Center(child: Text('数据为空'),)];
    }
    var children = List<Widget>();
    list.forEach((item)=>{
      children.add(_getItem(item))
    });
    return children;
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
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 20.0,
                padding: EdgeInsets.all(5.0),
                childAspectRatio: 2.0,
                children: _getWidgetList(),
              ),
          ),

        ],
      ),
    );
  }
}