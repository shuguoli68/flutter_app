import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/util/HttpUtils.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/bean/wy_news_entity.dart';
import 'package:toast/toast.dart';
import 'package:flutter_app/widget/web_widget.dart';

//https://www.apiopen.top/api.html

class WYNews extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _WYNews();
}

class _WYNews extends State<WYNews>{

  var listDatas = new List<WyNewsResult>();
  var page = 1;

  listMore(int page) async {
    var result = await HttpUtils.request(
        'https://api.apiopen.top/getWangYiNews',
        method: HttpUtils.POST,
        data: {
          'page':page,
          'count':20
        }
    );
    print(result);
    WyNewsEntity bean =EntityFactory.generateOBJ(result);
    setState(() {
      listDatas.addAll(bean.result);
    });
    return bean;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page = 1;
    listMore(page);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('网易新闻'),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(5.0),
          shrinkWrap: true,//高度会适配 item填充的内容的高度
          itemBuilder: (context, index){
            if(index >= listDatas.length-1){
              listMore(++page);
            }
            return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                    return new WebWidget(
                      url: listDatas[index].path,
                      title: "网易新闻",
                    );
                  }));
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(10.0),
                            child: ClipOval(
                              child: Image.network(listDatas[index].image,height: 50,width: 50,fit: BoxFit.fitHeight,),
                            ),
                          ),
                          Expanded(child: Text(listDatas[index].title,maxLines: 2,overflow: TextOverflow.ellipsis),)
                        ],
                      ),

                      Text(listDatas[index].passtime,textAlign: TextAlign.justify,),
                    ],
                  ),
                )
            );
          },
          itemCount: listDatas.length
      ),
    );
  }
}