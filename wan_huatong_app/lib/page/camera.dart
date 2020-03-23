import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:wan_huatong_app/json.dart';

var img;


class Camera extends StatefulWidget {
  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<Camera> {
  File _image;
  var url = "http://kaleidoscope.geefunlab.com/gateway.do";

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void upLoad(){
    if (_image == null) return;
    String base64Image = base64Encode(_image.readAsBytesSync());


    http.post(url,body: {
      "img":base64Image,
    }).then((response){
      img = jsonDecode(response.body);
      print(img["imgInfo"]["result"]);
      print(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拍照识物'),
        backgroundColor: Color.fromARGB(255, 119, 136, 213), //设置appbar背景颜色
        centerTitle: true,
      ),
      body:
      new Container(
        child: new Column(
          children: <Widget>[
             Expanded(
              flex: 6,
              child: Container(
                decoration: new BoxDecoration(
                  border: new Border.all(
                    width: 2.0,
                    color: Colors.black,
                  )
                ),
                alignment: Alignment.center,
                child: _image == null
                    ? Text('请拍摄照片！')
                    : Image.file(_image),
              ),
            ),
            new Expanded(
                flex: 1,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                        flex: 1,
                        child: MaterialButton(
                          color: Colors.yellow,
                            child: Icon(Icons.check),
                            onPressed: () {
                              Navigator.push(context,
                                  new MaterialPageRoute(builder: (context) => new receive()));
                            }
                        ),
                    ),
                    new Expanded(
                        flex: 1,
                        child: new Container(
                          child:new MaterialButton(
                            color: Colors.blue,
                            child: Icon(Icons.file_upload),
                            onPressed: () {
                              showDialog<Null>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return new AlertDialog(
                                    title: new Text('请稍等：'),
                                    content: new SingleChildScrollView(
                                      child: new ListBody(
                                        children: <Widget>[
                                          new Text('正在识别图片！'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      new FlatButton(
                                        child: new Text('确定'),
                                        onPressed: () {
                                          upLoad();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ).then((val) {
                                print(val);
                              });
                            },
                          ),
                        ),
                    ),
                    new Expanded(
                      flex: 1,
                        child: new MaterialButton(
                          color: Colors.green,
                          onPressed: getImage,
                          child: Icon(Icons.add_a_photo),
                        ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}


class receive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context,int index){
        var imageurl = img["imgInfo"]["result"][index]["baike_info"]["image_url"].toString();
        return Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("识别结果："+(index+1).toString()),
              Text("相似度："+img["imgInfo"]["result"][index]["score"].toString()),
              Text("分类目录："+img["imgInfo"]["result"][index]["root"].toString()),
              new Image.network(imageurl),
              Text("物品简介："+img["imgInfo"]["result"][index]["baike_info"]["description"].toString()),
              Text("关键字："+img["imgInfo"]["result"][index]["keyword"].toString()),
            ],
          ),
        );
      },
      itemCount: img["imgInfo"]["result"] == null ? 0 : img["imgInfo"]["result"].length,
    );
  }
}

