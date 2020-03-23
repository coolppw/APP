import 'package:flutter/material.dart';

class My extends StatefulWidget {
  @override
  MyState createState() => new MyState();
}

class MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("成长足迹"),
          backgroundColor: Color.fromARGB(255, 119, 136, 213), //设置appbar背景颜色
          centerTitle: true, //设置标题是否局中
        ),
        body: new Mysituation(),
      ),
    );
  }
}

class Mysituation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      //侧边栏按钮Drawer
      child: new ListView(
        children: <Widget>[
          //个人信息部分
          new Container(
              color: Color.fromARGB(155, 100, 36, 83),
              child: new Padding(
                padding: new EdgeInsets.all(26.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        //头像
                        new Container(
                          width: 80.0,
                          height: 80.0,
                          margin:
                          new EdgeInsets.only(right: 10.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: new NetworkImage(
                                  'http://www.chedan5.com/upload/article/201803/06/1740235a9e62077e0aexbcUQh.jpg'),
                              //从Assets加载图片
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              '学习进度',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                            new Text(
                              '勋章：',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            )
                          ],
                        )
                      ],
                    ),
                    new Text(
                      "康康",
                      style: new TextStyle(color: Colors.white, fontSize: 18.0),
                    )
                  ],
                ),
              )),
          new ListTile(
            //第二个功能项
            title: new Text('课程：人体、植物、宇宙......'),
            leading: new Icon(Icons.book),
          ),
          //分割线控件
          new ListTile(
            //退出按钮
            title: new Text('每周答题'),
            leading: new Icon(Icons.zoom_out_map),
          ),
          //分割线控件
          new ListTile(
            //退出按钮
            title: new Text('查看历史识别图片'),
            leading: new Icon(Icons.map),
          ),
          //分割线控件
          new ListTile(
            //退出按钮
            title: new Text('个人信息'),
            leading: new Icon(Icons.group_add),
          ),
          //分割线控件
          new ListTile(
            //退出按钮
            title: new Text('系统设置'),
            leading: new Icon(Icons.flight),
          ),
        ],
      ),
    );
  }
}