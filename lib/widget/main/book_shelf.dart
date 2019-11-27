import 'package:flutter/material.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';

class BookShelf extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BookShelf();
}

class _BookShelf extends State<BookShelf>{
  @override
  Widget build(BuildContext context) {
    print('BookShelf');
    return Scaffold(
      body: Text('BookShelf\n很多接口不能用了，然后追书神器好多不免费了，需要VIP'),
    );
  }

}