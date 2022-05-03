import 'package:get/get.dart';
import 'package:todo/db.dart';
import 'package:todo/models/taskdata.dart';

class controller extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future<int?> addtask({taskData? task}) async {
    return await DB.insert(task);
  }
}
