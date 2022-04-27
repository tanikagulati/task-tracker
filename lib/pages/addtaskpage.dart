import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Widgets/input_fields.dart';
import 'package:todo/pages/homepage.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new),
          onTap: () => Get.back(),
        ),
        actions: [Icon(Icons.person_rounded)],
      ),
      body: Column(children: [Text('Add Task'),
      //InputFields(title: 'Text', hint: 'Enter The title', controller: controller)
      ]),
    );
  }
}
