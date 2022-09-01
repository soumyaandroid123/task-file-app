import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_file_app/app/data/models/task.dart';
import 'package:task_file_app/app/data/services/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;

  HomeController({required this.taskRepository});

  final formKey = GlobalKey<FormState>();
  final editTaskCtrl = TextEditingController();
  final tasks = <Task>[].obs;
  final chipIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    //?? Replaces all existing items of this list with items
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTask(tasks));
  }

  @override
  void onClose() {
    super.onClose();
  }

  //?? change task icon index
  void changeChipIndex(int val){
    chipIndex.value = val;
  }

  // ?? Add the new task in the task list
  bool addTask(Task task){
    //?? this contains methods checked the existing task
    // if the task is already added then it'll return the false.
    if(tasks.contains(task)){
      return false;
    }
    // new task is added here.
    tasks.add(task);
    return true;
  }
}
