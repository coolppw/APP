import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';


class Make extends StatefulWidget{
  @override
  MakeState createState() => new MakeState();
}

class MakeState extends State<Make>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text('学习清单'),
        backgroundColor: Color.fromARGB(255, 119, 136, 213), //设置appbar背景颜色
        centerTitle: true,
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            _getContainer('植物', Icons.map,'学习进度：','images/plant.jpg'),
            _getContainer('动物', Icons.map,'学习进度：','images/animal.jpg'),
            _getContainer('建筑', Icons.map,'学习进度：','images/architecture.jpg'),
            _getContainer('交通工具', Icons.map,'学习进度：','images/vehicle.jpg'),
            _getContainer('宇宙', Icons.map,'学习进度：','images/universe.jpg'),
            _getContainer('海洋', Icons.map,'学习进度：','images/ocean.jpg'),
            _getContainer('陆地', Icons.map,'学习进度：','images/land.jpg'),
          ],
        ),
      ),
    );
  }
}

Widget _getContainer(String test, IconData icon,String text,String url) {
    return new Container(
      width: 160.0,
//      ListTile
      child: new ListTile(
//       显示在title之前
        leading: new Image.asset(
          url,
          width: 50,
          height: 50,
        ),
//        显示在title之后
        trailing: new Icon(Icons.map),
        title: new Text(test),
        subtitle: new Text(text),
      ),
    );
}

class receive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context,int index){
        return Card(
          child: new Text("ppw"),
        );
      },
    );
  }
}
