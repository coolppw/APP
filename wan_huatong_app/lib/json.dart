import 'dart:convert';
import 'package:flutter/material.dart';

class Scan {
  ImgInfo imgInfo;
  int errCode;
  String msg;

  Scan({this.imgInfo, this.errCode, this.msg});

  Scan.fromJson(Map<String, dynamic> json) {
    imgInfo =
    json['imgInfo'] != null ? new ImgInfo.fromJson(json['imgInfo']) : null;
    errCode = json['errCode'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imgInfo != null) {
      data['imgInfo'] = this.imgInfo.toJson();
    }
    data['errCode'] = this.errCode;
    data['msg'] = this.msg;
    return data;
  }
}

class ImgInfo {
  int log_Id;
  int result_Num;
  List<Result> result;

  ImgInfo({this.log_Id, this.result_Num, this.result});

  ImgInfo.fromJson(Map<String, dynamic> json) {
    log_Id = json['log_id'];
    result_Num = json['result_num'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['log_id'] = this.log_Id;
    data['result_num'] = this.result_Num;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  double score;
  String root;
  BaikeInfo baikeInfo;
  String keyword;

  Result({this.score, this.root, this.baikeInfo, this.keyword});

  Result.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    root = json['root'];
    baikeInfo = json['baike_info'] != null
        ? new BaikeInfo.fromJson(json['baike_info'])
        : null;
    keyword = json['keyword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['root'] = this.root;
    if (this.baikeInfo != null) {
      data['baike_info'] = this.baikeInfo.toJson();
    }
    data['keyword'] = this.keyword;
    return data;
  }
}

class BaikeInfo {
  String baikeUrl;
  String imageUrl;
  String description;

  BaikeInfo({this.baikeUrl, this.imageUrl, this.description});

  BaikeInfo.fromJson(Map<String, dynamic> json) {
    baikeUrl = json['baike_url'];
    imageUrl = json['image_url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['baike_url'] = this.baikeUrl;
    data['image_url'] = this.imageUrl;
    data['description'] = this.description;
    return data;
  }
}

