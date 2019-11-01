import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ChildListViewSeparated extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChildListViewSeparated();

}

class _ChildListViewSeparated extends State<ChildListViewSeparated>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView.Separated'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Toast.show('点击了$index', context,gravity: Toast.TOP);
              },
              onLongPress: (){
                Toast.show('长按了$index', context,gravity: Toast.TOP);
              },
              child: Container(
                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.amber, width: 1),
//                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10.0),
                      child: ClipOval(
                        child: Image.asset('images/user_ba.png',height: 50,width: 50,fit: BoxFit.fitHeight,),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text('title$index',),
                        Text('this is content $index'),
                      ],
                    )
                  ],
                ),
              )
            );
          },
          separatorBuilder: (context,index){
            return Container(height: 1,color: Colors.green,);
          },
          itemCount: 100),
    );
  }
}