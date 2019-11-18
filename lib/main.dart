import 'package:flutter/material.dart';

import 'widget/home_drawer.dart';
import 'widget/web_widget.dart';
import 'widget/main/book_shelf.dart';
import 'widget/main/book_sort.dart';
import 'widget/main/book_rank.dart';
import 'widget/main/main_mine.dart';

class MainApp extends StatefulWidget{
    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MainAppState();
  }
}


class _MainAppState extends State<MainApp> {

  int _tabIndex = 0;
  var _pageList;

  @override
  void initState() {
    // TODO: implement initState
    _pageList = [
      BookShelf(),
      BookSort(),
      BookRank(),
      MainMine(),
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: HomeDrawer(context).homeDrawer(),),
      appBar: new AppBar(
        title: new Text('FBook'),
      ),
      body: _pageList[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (index){
          setState(() {
            _tabIndex = index;
          });
        },

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