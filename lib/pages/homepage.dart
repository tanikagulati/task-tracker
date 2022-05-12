import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:todo/Widgets/tasktile.dart';
import 'package:todo/controller.dart';
import 'package:todo/notification.dart';
import 'package:intl/intl.dart';
import 'package:todo/pages/addtaskpage.dart';

final controller taskController = Get.put(controller());

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notify;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Notify notify = Notify();
    notify.initializeNotification();
    notify.requestIOSPermissions();
    // Notify().requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;
    var selectedDate = DateTime.now();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Positioned(
                  child: Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  left: 14.w,
                  top: 10.h,
                ),
                Positioned(
                    child: Text('Today',
                        style: TextStyle(
                            fontSize: 24,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    left: 14.w,
                    top: 38.h),
                Positioned(
                  right: 14.w,
                  top: 18.h,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => AddTask());
                      },
                      child: Text(
                        'Add Task',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(13, 71, 161, 1)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))))),
                ),
                Container(
                  height: 80.h,
                  margin: EdgeInsets.only(top: 80.h, left: 14.w),
                  child: DatePicker(
                    DateTime.now(),
                    height: 80.h,
                    width: 60.w,
                    initialSelectedDate: DateTime.now(),
                    monthTextStyle:
                        TextStyle(fontSize: 12, color: Colors.grey[700]),
                    dateTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                    dayTextStyle:
                        TextStyle(fontSize: 12, color: Colors.grey[700]),
                    selectionColor: Color(0xFF0D47A1),
                    selectedTextColor: Colors.white,
                    daysCount: 75,
                    onDateChange: (date) => selectedDate = date,
                  ),
                ),
                // Positioned(top: 200.h, child: showTasks()),
              ]),
              showTasks()
            ],
          ),
        ));
  }

  appbar() {
    double statusbar = MediaQuery.of(context).padding.top;
    return PreferredSize(
      preferredSize: Size(double.maxFinite, 50.h),
      child: Container(
        color: Colors.white,
        child: Stack(children: [
          Positioned(
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.person_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
            left: 8.w,
            top: statusbar + 5.h,
          ),
          Positioned(
              right: 8.w,
              top: statusbar + 5.h,
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Theme().switchTheme;
                  Notify().displayNotification(
                      title: "Notification", body: "This is a notification");
                  Notify().scheduledNotification();
                },
              )),
        ]),
      ),
    );
  }

  Widget showTasks() {
    taskController.getTasks();
    return Obx(() => SingleChildScrollView(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: GestureDetector(
                          child: TaskTile(taskController.taskList[index]),
                        ),
                      ),
                    ));
              }),
              itemCount: taskController.taskList.length),
        ));
  }
}
