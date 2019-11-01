import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ChildApply extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChildApply();

}

class _ChildApply extends State<ChildApply>{

  Widget itemList(context, int index){
    return GestureDetector(
      onTap: (){
        Toast.show('点击了$index', context,gravity: Toast.TOP);
      },
      onLongPress: (){
        Toast.show('长按了$index', context,gravity: Toast.TOP);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(),
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            ClipRRect(
              child:Image.asset('images/user_ba.png',scale: 8.5,fit: BoxFit.cover,width: 50,height: 50,),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),

            Column(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(5.0),child: Text('姓名$index'),),
                    Icon(Icons.people),
                  ],
                ),
                Padding(padding: EdgeInsets.all(5.0),child:Text('旅游、钢琴、游泳、$index',maxLines: 1,overflow: TextOverflow.ellipsis),)
              ],
            ),

            RaisedButton(
              color: Colors.green,
              child: Text('点击'),
              onPressed: (){
              Toast.show('点击了$index,按钮', context,gravity: Toast.TOP);
            },),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('综合使用'),
      ),
      body: ListView.separated(
          itemBuilder: itemList,
          separatorBuilder: (context,index){
            return Container(color: Colors.green,height: 1,);
          },
          itemCount: 500
      ),
    );
  }
}