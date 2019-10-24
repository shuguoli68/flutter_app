import 'package:flutter/material.dart';
import 'dart:io';

class ChildImage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChildImage();
  
}

class _ChildImage extends State<ChildImage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('1、资源图片：'),
              Image.asset('images/user_ba.png',width: 50,height: 50,),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('2、本地图片：'),
              ),
              Image.file(new File('/mnt/sdcard/1.png'),width: 50,height: 50,),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('3、网络图片：'),
              ),
              Image.network('http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',width: 50,height: 50,),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('4、加占位图网络图片：'),
              ),
              FadeInImage.assetNetwork(
                  placeholder: 'images/default.png',
                  image:'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
                width: 50,height: 50,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child:  Text('5、裁剪成圆角图片：'),
              ),
              ClipRRect(
                child:Image.asset('images/user_ba.png',scale: 8.5,fit: BoxFit.cover,width: 50,height: 50,),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('6、边框来实现图片圆角：'),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  image: DecorationImage(image: AssetImage('images/user_ba.png'),fit: BoxFit.cover)
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('7、裁剪来实现图片圆形：',),
              ),
              ClipOval(
                child: Image.asset('images/user_ba.png',width: 50,height: 50,fit: BoxFit.fitHeight,),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('8、CircleAvatar来实现图片圆形：'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/user_ba.png'),
                radius: 25.0,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('9、边框来实现图片圆形：'),
              ),
              Container(
                width: 50,height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    image: DecorationImage(image: AssetImage('images/user_ba.png'),fit: BoxFit.cover)
                ),
              )

            ],
          ),
        )
      ),
    );
  }
  
}
