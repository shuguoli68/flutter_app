import 'dart:async';

import 'package:flutter/material.dart';

import 'global/my_public.dart';
import 'global/common.dart';
import 'package:flutter_app/global/common.dart';
import 'package:provide/provide.dart';
import 'global/theme_provide.dart';
import 'global/theme_colors.dart';
import 'main.dart';

void main() async{//主页

  var providers = Providers();

  providers.provide(Provider.function((context)=> ThemeProvide()));

  SharedPreferences sp = await SharedPreferences.getInstance();
  int themeIndex = sp.getInt("themeIndex");
  themeIndex =  null == themeIndex ? 0 : themeIndex;

  runApp(ProviderNode(child: Splash(themeIndex), providers: providers));
}

class Splash extends StatelessWidget{
  int themeIndex;

  Splash(this.themeIndex);

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
          home: SplashBody(),
        );
      },
    );
  }

}

class SplashBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashBody();
}

class _SplashBody extends State<SplashBody>{

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){goToRm(context, MainApp());});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[

          Image.asset('images/fbook.png',fit: BoxFit.fill,width: double.maxFinite,height: double.maxFinite,),

          Text('FBook'),

        ],
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}