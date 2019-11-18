import 'package:flutter/material.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';

class MainMine extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainMine();
}

class _MainMine extends State<MainMine>{
  @override
  Widget build(BuildContext context) {
    print('MainMine');
    return Scaffold(
      body: Text('MainMine'),
    );
  }
}