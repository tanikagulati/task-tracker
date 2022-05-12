import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/models/taskdata.dart';

class TaskTile extends StatelessWidget {
  taskData? task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.blue[900]),
      child: Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                task!.title,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '${task!.startTime} - ${task!.endTime}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Text(
                task!.note,
                style: TextStyle(color: Colors.white,fontSize: 16.sp),
              )
            ],
          ),
        ),
        Container(height: 50.h, width: 0.5.w),
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              task!.iscompleted == 1 ? 'COMPLETED' : 'TO-DO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ))
      ]),
    );
  }
}







// List view builder scroll and single child scroll view will not work together, use never scrollable scroll physics in builder
// The parent widget takes the entire space available to draw the widget, Here Container is the parent widget, and it's taking whatever space is available, wrap container in a widget Align