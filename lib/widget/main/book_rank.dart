import 'package:flutter/material.dart';
import 'package:flutter_app/global/my_public.dart';
import 'package:flutter_app/global/common.dart';

class BookRank extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BookRank();
}

class _BookRank extends State<BookRank>{
  @override
  Widget build(BuildContext context) {
    print('BookRank');
    return Scaffold(
      body: Text('BookRank'),
    );
  }
}