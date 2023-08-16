import 'package:get/get.dart';
import 'package:assignment13/data/models/network_response.dart';
import 'package:assignment13/data/models/task_list_model.dart';
import 'package:assignment13/data/services/network_caller.dart';

class GetTasksController extends GetxController {
  bool _getTaskInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  void getUpdateState() {
    update();
  }

  bool get getTaskInProgress => _getTaskInProgress;

  TaskListModel get taskListModel => _taskListModel;

  Future<bool> getTasks(String url) async {
    _getTaskInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(url);
    _getTaskInProgress = false;
    update();
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
      update();
      return true;
    } else {
      return false;
    }
  }
}
