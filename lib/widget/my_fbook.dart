
import 'package:flutter/material.dart';

import 'main/book_shelf.dart';
import 'main/book_sort.dart';
import 'main/book_rank.dart';
import 'main/main_mine.dart';

class FBook extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FBook();
  }
}


class _FBook extends State<FBook> {

  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('FBook'),
      ),
      body: IndexedStack(
        index: _tabIndex,
        children: <Widget>[
          BookShelf(),
          BookSort(),
          BookRank(),
          MainMine(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (index){
          setState(() {
            _tabIndex = index;
          });
        },
        key: ObjectKey('$_tabIndex'),

        iconSize: 24.0,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('书架')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('分类')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('排行榜')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('我的')
          ),
        ],
      ),
    );
  }
}