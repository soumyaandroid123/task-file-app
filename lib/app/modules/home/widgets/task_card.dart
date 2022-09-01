import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_file_app/app/core/values/colors.dart';
import 'package:task_file_app/app/data/models/task.dart';
import 'package:task_file_app/app/modules/home/controller.dart';
import 'package:task_file_app/app/core/utils/extension.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TaskCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final Task task;

  TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = HexColor.fromHex(task.color);
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      decoration: BoxDecoration(
          color: color.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(1.0, 1.0),
                blurRadius: 0.5,
                spreadRadius: 0.5),
            BoxShadow(
                color: Colors.white.withOpacity(0.1),
                offset: Offset(-1.0, -1.0),
                blurRadius: 0.4,
                spreadRadius: 0.4),
          ],
          borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepProgressIndicator(
            //?? change after finish the individual task
            totalSteps: 100,
            currentStep: 15,
            size: 5,
            padding: 0,
            selectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(0.5), color]),
            unselectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white]),
          ),
          Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  IconData(task.icon, fontFamily: 'MaterialIcons'),
                  color: color,
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.0.wp, horizontal: 6.0.wp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 16.0,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 2.0.wp,
                ),
                Text(
                  '${task.taskLists?.length ?? 0} Task',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: textColor,
                      fontSize: 12.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
