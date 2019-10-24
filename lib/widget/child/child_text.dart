import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ChildText extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChildText();

}

class _ChildText extends State<ChildText> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('正常',
              ),
            Text('字间距增大',
              style: TextStyle(color: Colors.amber,fontSize: 14,letterSpacing: 10.0),
            ),
            Text('加上背景颜色',
              style: TextStyle(color: Colors.amber,fontSize: 14,backgroundColor: Colors.black26,),
            ),
            Text('字体粗体-倾斜',
              style: TextStyle(color: Colors.amber,fontSize: 14,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
            ),
            Text('文字装饰-线条',
              style: TextStyle(color: Colors.amber,fontSize: 14,decoration: TextDecoration.lineThrough,decorationColor: Colors.red,decorationStyle: TextDecorationStyle.wavy),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: (){
                  Toast.show('点击了文字', context);
                },
                child: Text('可以点击,Padding包裹Text',style: TextStyle(backgroundColor: Colors.black12),),
              ),
            ),
            Text('text最大maxLines=2 text最大maxLines=2 text最大maxLines=2 text最大maxLines=2 text最大maxLines=2 text最大maxLines=2 text最大maxLines=2 text最大maxLines=2',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              color: Colors.blue,
              child: Text('设置margin、padding'),
            ),
            Text.rich(TextSpan(
              text: 'Text.rich',
              children: <TextSpan>[
                TextSpan(
                  text: '文字1',
                  style: TextStyle(color: Colors.red)
                ),
                TextSpan(
                  text: '文字2',
                  style: TextStyle(color: Colors.green)
                ),
                TextSpan(
                  text: '文字3',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(
                  text: '文字拼接'
                )
              ]
            ))
          ],
        ),
      ),
    );
  }
}