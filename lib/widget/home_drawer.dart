import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_app/global/theme_provide.dart';
import 'package:flutter_app/global/theme_colors.dart';
import 'package:flutter_app/global/my_public.dart';

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
        Toast.show('点击了', context,gravity: Toast.TOP);
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
              Toast.show('点击A', context,gravity: Toast.TOP);
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
              Toast.show('点击B', context,gravity: Toast.TOP);
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