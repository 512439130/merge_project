import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merge_project/demo/FileDisplayWidgetDemo.dart';
import 'package:merge_project/demo/GridGeneralWidgetDemo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merge_project/demo/const/Constant.dart';
import 'package:oktoast/oktoast.dart';



//常量定义
const String name1 = 'flutter_merge';
const String taskTitle = 'flutter_merge title';

//主函数
void main() {
  runApp(MyApp());
  //如果机型是Android 设置Android状态栏透明沉浸式
  checkPhoneType();
}

//如果机型是Android 设置Android状态栏透明沉浸式
void checkPhoneType() {
  if (Platform.isAndroid) {
    print('Devices is Android');
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  } else if (Platform.isIOS) {
    print('Devices is iOS');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      /// set toast style, optional
      child: MaterialApp(
        title: taskTitle, //唤出任务管理器title
        theme: new ThemeData(
          //状态栏颜色
          primaryColor: Colors.greenAccent,
          accentColor: const Color(0xFF00FFFF),
          hintColor: Colors.blue,
        ),
        home: MyHomePage(),
        routes: <String, WidgetBuilder>{
          // 定义静态路由，不能传递参数

          '/router/demo/widget/GridGeneralWidgetDemo': (_) => new GridGeneralWidgetDemo(),
          '/router/demo/widget/FileDisplayWidgetDemo': (_) => new FileDisplayWidgetDemo(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //生成MaterialButton
  MaterialButton buildButton(
      String value, Color textColor, Color background, String route) {
    return new MaterialButton(
      child: Text(value),
      color: background,
      textColor: textColor,
      onPressed: () {
        openView(route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: Constant.screen_width, height: Constant.screen_height,allowFontScaling: false)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
    print('设备高度:${ScreenUtil.screenHeight}'); //Device height
    print('设备的像素密度:${ScreenUtil.pixelRatio}'); //Device pixel density
    print('底部安全区距离:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print('状态栏高度:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px
    print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
    print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');
    print('宽度和字体相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
    print('高度相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');
    print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');
    return Scaffold(
        appBar: AppBar(
          title: Text(name1),
        ),
        body: new ListView(
          physics: BouncingScrollPhysics(), //回弹效果
          children: <Widget>[


            new Container(
              color: const Color(0xFFFFFFFF),
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: buildButton("FileDisplayWidgetDemo", Colors.white, Colors.deepOrangeAccent,
                  '/router/demo/widget/FileDisplayWidgetDemo'),
            ),

            new Container(
              color: const Color(0xFFFFFFFF),
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: buildButton("GridGeneralWidgetDemo", Colors.white, Colors.deepOrangeAccent,
                  '/router/demo/widget/GridGeneralWidgetDemo'),
            ),

          ],

        ));
  }

  openView(String route) {
    Navigator.of(context).pushNamed(route);
  }
}
