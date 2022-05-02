import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Widgets/input_fields.dart';
import 'package:todo/pages/homepage.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var selectedDate = DateTime.now();
  var startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  var endTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  bool? selectingStartTime;
  int remind = 5;
  String repeat = 'None';
  Iterable remindList = ['5', '10', '15', '20', '30'];
  Iterable repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        // title: Text(
        //   'Add Task',
        //   style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        // ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new),
          onTap: () => Get.back(),
        ),
        actions: [
          Padding(
            child: Icon(Icons.person_rounded),
            padding: EdgeInsets.only(right: 12.w),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Add Task',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          InputFields(title: 'Title', hint: 'Enter a Title'),
          InputFields(title: 'Note', hint: 'Enter a Note'),
          InputFields(
            title: 'Date',
            hint: DateFormat.yMd().format(selectedDate),
            widget: IconButton(
              icon: Icon(Icons.calendar_today_outlined),
              onPressed: () {
                showCalendar();
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: InputFields(
                title: 'Start Time',
                hint: startTime.toString(),
                widget: IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () {
                    showClock(true);
                  },
                ),
              )),
              SizedBox(width: 16),
              Expanded(
                  child: InputFields(
                title: 'End Time',
                hint: endTime.toString(),
                widget: IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () {
                    showClock(false);
                  },
                ),
              ))
            ],
          ),
          InputFields(
              title: 'Reminder',
              hint: '$remind minutes early',
              widget: DropdownButton(
                  elevation: 4,
                  underline: Container(),
                  onChanged: (String? optedvalue) {
                    setState(() {
                      remind = int.parse(optedvalue!);
                    });
                  },
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: remindList.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                        child: Text(value.toString()), value: value.toString());
                  }).toList())),
          InputFields(
              title: 'Repeat',
              hint: '$repeat',
              widget: DropdownButton(
                  elevation: 4,
                  underline: Container(),
                  onChanged: (String? optedvalue) {
                    setState(() {
                      repeat = optedvalue!;
                    });
                  },
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: repeatList.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                        child: Text(value), value: value);
                  }).toList())),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (null),
                  child: Container(
                    width: 130.w,
                    height: 40.h,
                    child: Center(
                      child: Text(
                        'Create',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(13, 71, 161, 1)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                  )),
            ],
          ),
        ]),
      ),
    );
  }

  showCalendar() async {
    DateTime? datepicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));

    //print(value);
    setState(() {
      selectedDate = datepicked!;
    });
  }

  showClock(bool selectingStartTime) async {
    TimeOfDay? timepicked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (selectingStartTime == true) {
      setState(() {
        startTime = timepicked!.format(context).toString();
      });
    } else {
      setState(() {
        endTime = timepicked!.format(context).toString();
      });
    }
  }
}
