import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_app/widget/form/my_fbook.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';
import 'redux/page/page_login.dart';
import 'theme/theme_provide.dart';
import 'theme/theme_colors.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/widget/form/first_demo.dart';
import 'package:flutter_app/widget/form/form_widget.dart';
import 'package:flutter_app/widget/form/my_dialog.dart';
import 'package:flutter_app/widget/form/my_anim.dart';
import 'package:flutter_app/widget/form/my_save.dart';
import 'package:flutter_app/widget/form/my_dio.dart';
import 'package:flutter_app/widget/form/home_drawer.dart';

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

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(routes.buildPage('login',null));
                },child: Text('fish_redux'),)
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

  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      /// 注册登陆主页面
      "login": LoginPage(),

      /// 注册用户注册页面
//      "register":RegisterPage(),

      /// 注册首页
//      "home": HomePage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      /// AOP
      /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
      /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[safetyAdapter<dynamic>()],

        /// Effect AOP
//        effectMiddleware: [
//          _pageAnalyticsMiddleware<dynamic>(),
//        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          //这块主要用到middleware的打印功能，监听Action在页面间的调整过程
          logMiddleware<dynamic>(tag: page.runtimeType.toString()), //这块主要用到middleware的打印功能，监听Action在页面间的调整过程
        ],
      );
    },
  );

  /// 简单的 Effect AOP
  /// 只针对页面的生命周期进行打印
  EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
    return (AbstractLogic<dynamic> logic, Store<T> store) {
      return (Effect<dynamic> effect) {
        return (Action action, Context<dynamic> ctx) async {
          if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
            print('${logic.runtimeType} ${action.type.toString()} ');
          }
          return effect?.call(action, ctx);
        };
      };
    };
  }
}