import 'package:flutter/material.dart';

import 'package:wan_huatong_app/page/camera.dart';
import 'package:wan_huatong_app/page/make.dart';
import 'package:wan_huatong_app/page/list.dart';
import 'package:wan_huatong_app/page/foot.dart';


class MyApp extends StatefulWidget {

  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new Camera(),
            new Make(),
            new Learn_List(),
            new My(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.white,
          child: new TabBar(
            controller: controller,
            labelColor: Colors.deepPurpleAccent,
            unselectedLabelColor: Colors.black26,
            tabs: <Widget>[
              new Tab(
                text: "拍照识物",
                icon: new Icon(Icons.photo_camera),
              ),
              new Tab(
                text: "学习清单",
                icon: new Icon(Icons.book),
              ),
              new Tab(
                text: "游记制作",
                icon: new Icon(Icons.map),
              ),
              new Tab(
                text: "成长足迹",
                icon: new Icon(Icons.directions_run),
              ),
            ],
          ),
        ),
      ),
    );
  }
}