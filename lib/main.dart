import 'package:flutter/material.dart';
import 'package:flutter_app/widget/my_fbook.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';
import 'theme/theme_provide.dart';
import 'theme/theme_colors.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/widget/first_demo.dart';
import 'package:flutter_app/widget/form_widget.dart';
import 'widget/my_dialog.dart';
import 'widget/my_anim.dart';
import 'widget/my_save.dart';
import 'widget/my_dio.dart';
import 'widget/home_drawer.dart';

void main() async{

  var providers = Providers();

  providers.provide(Provider.function((context)=> ThemeProvide()));

  SharedPreferences sp = await SharedPreferences.getInstance();
  int themeIndex = sp.getInt("themeIndex");
  themeIndex =  null == themeIndex ? 0 : themeIndex;

  runApp(ProviderNode(child: MyApp(themeIndex), providers: providers));
}

class MyApp extends StatelessWidget{

  int themeIndex;

  MyApp(this.themeIndex);

  _themeColor(ThemeProvide theme, String type){
    return THColors.themeColor[theme.value != null ? theme.value: themeIndex][type];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provide<ThemeProvide>(
      builder: (context,child,theme){
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: _themeColor(theme,'primaryColor'),
            primaryColorDark: _themeColor(theme,'colorPrimaryDark'),
            primaryColorLight: _themeColor(theme,'colorPrimaryLight'),
            accentColor:  _themeColor(theme,'colorAccent'),
          ),
          home: new MainApp(),
        );
      },
    );
  }
}

class MainApp extends StatefulWidget{
    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainAppState();
  }
}

class MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: HomeDrawer(context).homeDrawer(),),
      appBar: new AppBar(
        title: new Text('Flutter学习'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              child:RaisedButton(onPressed:(){
                _goTo(FirstApp());
              },child: Text('FirstDemo'),),
            ),

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(FormWidget());
                },child: Text('基础控件'),)
            ),

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(MyDialog());
                },child: Text('对话框'),)
            ),

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(MyAnim());
                },child: Text('动画'),)
            ),

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(MySave(storage: TextStorage(),));
                },child: Text('存储'),)
            ),

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(MyDio(dioUtil: DioUtil(),));
                },child: Text('网络请求Dio'),)
            ),

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(FBook());
                },child: Text('FBook'),)
            ),
          ],
        ),
      )
    );
  }

  _goTo(Widget key){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return key;
    }));
  }
}