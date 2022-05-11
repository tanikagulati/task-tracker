import 'package:get/get.dart';
import 'package:todo/db.dart';
import 'package:todo/models/taskdata.dart';

class controller extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  var taskList = <taskData>[].obs;

  static Future<int?> addtask({taskData? task}) async {
    return await DB.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DB.query();
    taskList.assignAll(tasks.map((e) => taskData.fromjson(e)).toList());
  }

  void delete(task){
    DB.delete(task);
  }
}
