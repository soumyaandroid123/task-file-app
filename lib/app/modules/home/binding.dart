import 'package:get/get.dart';
import 'package:task_file_app/app/data/providers/task/provider.dart';
import 'package:task_file_app/app/data/services/storage/repository.dart';
import 'package:task_file_app/app/modules/home/controller.dart';

// ?? Bindings should be extended or implemented.
// When using GetMaterialApp, all GetPages and
// navigation methods (like Get.to()) have a binding property
// that takes an instance of Bindings to manage the dependencies()
// (via Get.put()) for the Route you are opening.
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}
