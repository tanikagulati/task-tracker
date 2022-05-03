import 'package:flutter/cupertino.dart';

class taskData {
  int? id;
  int iscompleted = 0;
  String title = "";
  String note = "";
  String date = "";
  String startTime = "";
  String endTime = "";
  int remind = 0;
  String repeat = "";

  taskData({
    this.id,
    required this.iscompleted,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remind,
    required this.repeat,
  });

  taskData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    iscompleted = json['iscompleted'];
    title = json['title'];
    note = json['note'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    remind = json['remind'];
    repeat = json['repeat'];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['iscompleted'] = this.iscompleted;
    data['title'] = this.title;
    data['note'] = this.note;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['remind'] = this.remind;
    data['repeat'] = this.repeat;
    return data;
  }
}
