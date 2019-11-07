# My Flutter project
Trying to develop a mobile app using Flutter was a bit uncomfortable at first, but the development efficiency did improve.  

# flutter_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application. 

A few resources to get you started if this is your first Flutter project:

- [Flutter中文网: https://flutterchina.club/](https://flutterchina.club/)
- [FlutterAwesome: https://flutterawesome.com/](https://flutterawesome.com/)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.  
  
## Flutter和原生Android控件对比:  
| Flutter控件 | Android控件 | 
| - | -: | 
| AppBar | ActionBar/ToolBar| 
| Text | TextView | 
| Image | ImageView | 
| IconButton | ImageButton | 
| TextFiled | EditText | 
| RaisedButton/Button | Button | 
| Checkbox、CheckboxListTile | Checkbox | 
| Drawer | DrawerLayout | 
| Fluttertoast | Toast | 
| LinearProgressIndicator、CircularProgressIndicator | ProgressBar | 
| Algin | alginParentXXX属性 | 
| Column | LinearLayout的android:orientation="vertical" | 
| Row | android:orientation="horizontal" | 
| Container | RelativeLayout | 
| Stack | FrameLayout/RelativeLayout | 
| ListView | ListView/RecyclerView | 
| CustomScrollerView | Recyclerview | 
| SingleChildScrollView | ScrollView | 
| Center | ViewGroup | 
| resizeToAvoidBottomPadding | android:windowSoftInputMode=”adjustResize属性 | 
| BottomNavigationBar | BottomNavigation(design库里面的) | 


## Screenshots
<div align="center">
<img src="/Screenshots/text.png"  height="480" width="270">
<img src="/Screenshots/image.png"  height="480" width="270">
<img src="/Screenshots/textfiled.png"  height="480" width="270">
</div>

## Completed

+ 基础控件
    + Text   [查看源码](/lib/widget/child/child_text.dart)
    + Image  [查看源码](/lib/widget/child/child_image.dart)
    + TextFiled  [查看源码](/lib/widget/child/child_textfiled.dart)
    + Button  [查看源码](/lib/widget/child/child_button.dart)
    + ListView  [查看源码](/lib/widget/child/child_listView.dart)
    + Drawer  [查看源码](/lib/widget/home_drawer.dart)
+ Dialog  [查看源码](/lib/widget/child/my_dialog.dart)
+ Anim  [查看源码](/lib/widget/child/my_anim.dart)
+ Save  [查看源码](/lib/widget/child/my_save.dart)
+ Dio  [查看源码](/lib/widget/child/my_dio.dart)        