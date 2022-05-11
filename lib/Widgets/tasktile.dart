import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/models/taskdata.dart';

class TaskTile extends StatelessWidget {
  taskData? task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: ScreenUtil().screenWidth,
          margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.blue[900]),
            child: Row(children: [
              Expanded(
                  child: Column(
                children: [
                  Text(
                    task!.title,
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded),
                      SizedBox(width: 5.w),
                      Text('${task!.startTime} - ${task!.endTime}')
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(task!.note),
                ],
              )),
              Container(height: 50.h, width: 0.5.w),
              RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    task!.iscompleted == 1 ? 'COMPLETED' : 'TO-DO',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ]),
          ),
        ),
      );
  }
}
