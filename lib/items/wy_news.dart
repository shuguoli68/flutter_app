import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/util/HttpUtils.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/bean/wy_news_entity.dart';
import 'package:toast/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

//https://www.apiopen.top/api.html

class WYNews extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _WYNews();
}

class _WYNews extends State<WYNews>{

  var listDatas = new List<WyNewsResult>();

  listMore(int page,int count) async {
    var result = await HttpUtils.request(
        'https://api.apiopen.top/getWangYiNews',
        method: HttpUtils.POST,
        data: {
          'page':page,
          'count':count
        }
    );
    print(result);
    WyNewsEntity bean =EntityFactory.generateOBJ(result);
    return bean;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('网易新闻'),
      ),
      body: Center(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(5.0),
            itemExtent: 50,
            itemBuilder: (context, index){
              return GestureDetector(
                  onTap: (){
                    WebView(
                      initialUrl: listDatas[index].path,
                      javascriptMode: JavascriptMode.unrestricted,
                    );
                    Toast.show('点击了$index', context,gravity: Toast.TOP);
                  },
                  onLongPress: (){
                    Toast.show('长按了$index', context,gravity: Toast.TOP);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: Divider.createBorderSide(context,color: Colors.grey,width: 1)
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10.0),
                          child: ClipOval(
                            child: Image.network(listDatas[index].image,height: 50,width: 50,fit: BoxFit.fitHeight,),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(listDatas[index].title,),
                            Text(listDatas[index].passtime),
                          ],
                        )
                      ],
                    ),
                  )
              );
            },
            itemCount: listDatas.length
        ),
      ),
    );
  }
}