import 'package:flutter/material.dart';
import 'package:flutter_app/global/common.dart';
import 'package:flutter_app/items/weather_entity.dart';

import 'package:flutter_app/util/HttpUtils.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/widget/web_widget.dart';

class WeatherWeek extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _WeatherWeek();
}

class _WeatherWeek extends State<WeatherWeek> {

  TextEditingController controller = new TextEditingController();
  WeatherEntity bean = null;

  listMore(String city) async {
    if(city==null || city.isEmpty){
      city = "上海";
    }
    var result = await HttpUtils.request(
        'https://www.apiopen.top/weatherApi',
        method: HttpUtils.POST,
        data: {
          'city':city
        }
    );
    print(result);
    setState(() {
      bean =EntityFactory.generateOBJ(result);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listMore("");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('实时天气'),
      ),
      body: Column(
        children: <Widget>[

          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.ac_unit),
                    labelText: '城市名：',
                    hintText: '请输入城市名，如：‘上海’',
                  ),
                ),
              ),
              RaisedButton(onPressed: (){
                listMore(controller.text.toString());
              },child: Text('查询'),),
            ],
          ),

          ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(5.0),
              shrinkWrap: true,//高度会适配 item填充的内容的高度
              itemBuilder: (context, index){
                return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                        return new WebWidget(
                          url: 'https://www.apiopen.top/api.html',
                          title: "api接口",
                        );
                      }));
                    },
                    onLongPress: (){
                      myToast('长按了$index');
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
                          Text(bean.data.forecast[index].toString(),maxLines: 5,overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    )
                );
              },
              itemCount: bean.data.forecast.length
          ),
        ],
      )
    );
  }
}