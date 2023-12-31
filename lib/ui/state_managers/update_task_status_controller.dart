import 'package:get/get.dart';
import 'package:assignment13/data/models/network_response.dart';
import 'package:assignment13/data/services/network_caller.dart';
import 'package:assignment13/data/utility/urls.dart';

class UpdateTaskStatusController extends GetxController {
  bool _updateTaskInProgress = false;

  bool get updateTaskInProgress => _updateTaskInProgress;

  void getUpdateState() {
    update();
  }

  Future<bool> updateTask(String taskId, String newStatus) async {
    _updateTaskInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.updateTask(taskId, newStatus));
    _updateTaskInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
