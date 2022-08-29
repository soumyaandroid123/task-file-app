import 'package:task_file_app/app/data/models/task.dart';
import 'package:task_file_app/app/data/providers/task/provider.dart';

class TaskRepository{
  TaskProvider taskProvider;
  TaskRepository ({required this.taskProvider});

  List<Task> readTasks() => taskProvider.readTask();
  void writeTask(List<Task> tasks) => taskProvider.writeTask(tasks);
}