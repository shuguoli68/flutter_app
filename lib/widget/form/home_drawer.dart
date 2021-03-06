import 'package:flutter/material.dart';
import 'package:flutter_app/global/common.dart';
import 'package:provide/provide.dart';
import 'package:flutter_app/theme/theme_provide.dart';
import 'package:flutter_app/theme/theme_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer {

  BuildContext context;

  HomeDrawer(@required this.context);

  Widget _drawerHerder(){
    return UserAccountsDrawerHeader(
      accountName: Text('YourName'),
      accountEmail: Text('youremail@163.com'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('images/user_ba.png'),
      ),
      onDetailsPressed: (){
        myToast('点击了');
        print('点击');
      },
    );
  }

  void showThemeDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('切换主题'),
          content: SingleChildScrollView(
            child: Container(
              //包含ListView要指定宽高
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: THColors.themeColor.keys.length,
                itemBuilder: (BuildContext context, int position) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.only(bottom: 15),
                      color: THColors.themeColor[position]["primaryColor"],
                    ),
                    onTap: () async {
                      Provide.value<ThemeProvide>(context).setTheme(position);
                      //存储主题下标
                      SharedPreferences sp = await SharedPreferences.getInstance();
                      sp.setInt("themeIndex", position);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget homeDrawer(){
    return ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[

        _drawerHerder(),

        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.green,width: 1)
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(child: Text('A'),),
            title: Text('This is item A'),
            onTap: (){
              print('点击A');
              myToast('点击A');
            },
          ),
        ),

        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.green,width: 1)
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(child: Text('B'),),
            title: Text('This is item B'),
            onTap: (){
              print('点击B');
              myToast('点击B');
            },
          ),
        ),

        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.green,width: 1)
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(child: Text('C'),),
            title: Text('切换主题'),
            onTap: (){
              print('切换主题');
              showThemeDialog();
            },
          ),
        ),

      ],
    );
  }
}