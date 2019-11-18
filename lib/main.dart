import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';
import 'theme/theme_provide.dart';
import 'theme/theme_colors.dart';
import 'widget/home_drawer.dart';

void main() async{//主页

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
        title: new Text('FBook'),
      ),
    );
  }

  _goTo(Widget key){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return key;
    }));
  }
}