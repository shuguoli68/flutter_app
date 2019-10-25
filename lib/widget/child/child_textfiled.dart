import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ChildTextFiled extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChildFiled();
}

class _ChildFiled extends State<ChildTextFiled> {

  @override
  Widget build(BuildContext context) {

    TextEditingController controller1 = new TextEditingController();
    bool isPwd = false;

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('TextFiled'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller1,
                keyboardType: TextInputType.numberWithOptions(signed: true,decimal: true),
                obscureText: isPwd,
                textInputAction: TextInputAction.search,
                maxLength: 5,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(onPressed: (){
                    Toast.show('输入：'+controller1.text, context,gravity: Toast.TOP);
                  },child: Text('显示'),),
                  RaisedButton(onPressed: (){
                    controller1.clear();
                  },child: Text('清除'),),
                  RaisedButton(onPressed: (){
                    setState(() {
                      isPwd = !isPwd;
                    });
                  },child: Text('明暗文'),)
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
              ),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.accessibility),
                  labelText: '用户名：',
                  helperText: '用户名应少于6个字符',
                  hintText: '请输入用户名',
                  prefixIcon: Icon(Icons.account_box),
                  suffixIcon: Icon(Icons.clear,),
                ),
                onChanged: (content){
                  Toast.show(content, context,gravity: Toast.TOP);
                },
              ),


            ],
          ),
        ),
      ),
    );
  }

}