import 'package:flutter/material.dart';
import 'package:flutter_app/global/my_public.dart';

myToast(BuildContext context,String s){
  Toast.show(s, context,gravity: Toast.CENTER);
}

mySp() async {
  return await SharedPreferences.getInstance();;
}

goTo(BuildContext context, Widget key){
  Navigator.of(context).push(MaterialPageRoute(builder: (_){
    return key;
  }));
}

goToRm(BuildContext context, Widget key){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_){
    return key;
  }), (route) => route == null);
}
