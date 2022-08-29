import 'dart:convert';
import 'package:get/get.dart';
import 'package:task_file_app/app/core/utils/keys.dart';
import 'package:task_file_app/app/data/models/task.dart';
import 'package:task_file_app/app/data/services/storage/services.dart';

class TaskProvider {
  final _storageService = Get.find<StorageService>();

  //?? read task from storage task
  List<Task> readTask() {
    var tasks = <Task>[];
    jsonDecode(_storageService.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  // ?? List of json tasks returned as this format
 /* {'tasks':[
  {'title':'Personal',
  'color': '#ff123456',
  'icon': '0xe123'}
  ]}*/

  // ?? write task from storage task
  void writeTask(List<Task> tasks){
    _storageService.write(taskKey, jsonEncode(tasks));
  }
}
