import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';


class FirstApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<FirstApp>{
  final _suggesstions = <WordPair>[];
  final _bigfont = new TextStyle(fontSize: 18.0);
  final _save = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('列表显示'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSave),
          new IconButton(icon: new Icon(Icons.account_circle), onPressed: _pushMy)
        ],
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildRow(WordPair w){
    final _isSaved = _save.contains(w);
    return new ListTile(
      title: new Text(
        w.asPascalCase,
        style: _bigfont,
      ),
      trailing: new Icon(
        _isSaved?Icons.favorite:Icons.favorite_border,
        color: _isSaved?Colors.red:null,
      ),
      onTap: (){
        setState(() {
          if(_isSaved){
            _save.remove(w);
          }else{
            _save.add(w);
          }
        });
      },
    );
  }
  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context,i){
          if(i.isOdd){
            // 在每一列之前，添加一个1像素高的分隔线widget
            return new Divider();
          }
          final index = i ~/ 2;
          if(index >= _suggesstions.length){//列表中最后一个
            _suggesstions.addAll(generateWordPairs().take(5));
          }
          return _buildRow(_suggesstions[index]);
        }
    );
  }

  void _pushSave(){//第二页面：已收藏页面
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder:(context){
              final tiles = _save.map(
                      (pa){
                    return ListTile(
                      title: new Text(
                        pa.asPascalCase,
                        style: _bigfont,
                      ),
                    );
                  }
              );
              final divided = ListTile
                  .divideTiles(
                context: context,
                tiles: tiles,
              ).toList();
              return new Scaffold(
                appBar: new AppBar(
                  title: new Text('已收藏'),
                ),
                body: new ListView(children: divided,),
              );
            }
        )
    );
  }
  void _pushMy(){//第三页面：个人主页
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return new Scaffold(
        appBar: new AppBar(title: new Text('个人主页'),),
        body: new ListView(
          children: <Widget>[
            new Image.asset('images/user_ba.png',width: 600.0,height: 240.0,fit: BoxFit.cover,),
            titleSection,
            buttonSection,
            txtSection,
          ],
        ),
      );
    }));
  }

  Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child:new Row(
          children: [
            new Expanded(
              child:new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text('Oeschinen Lake Campground',style: new TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  new Text('Kandersteg, Switzerland',style: new TextStyle(color: Colors.grey[500]),)
                ],
              ),
            ),
            new Icon(Icons.star,color: Colors.red[500],),
            new Text('50')
          ]
      )
  );

  static Column addColumn(IconData icon, String label){
    Color color = Colors.deepPurpleAccent;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon,color: color,),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color
            ),
          ),
        )
      ],
    );
  }
  Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          addColumn(Icons.call, 'CALL'),
          addColumn(Icons.near_me, 'ROUTE'),
          addColumn(Icons.share, 'SHARE')
        ],
      )
  );

  Widget txtSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text('''
    Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
    ''',
        softWrap: true,)
  );
}