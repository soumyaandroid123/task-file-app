import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_file_app/app/core/values/colors.dart';
import 'package:task_file_app/app/core/values/icons.dart';
import 'package:task_file_app/app/data/models/task.dart';
import 'package:task_file_app/app/modules/home/controller.dart';
import 'package:task_file_app/app/widgets/icons.dart';
import 'package:task_file_app/app/core/utils/extension.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
              radius: 5,
              title: "Task Type",
              content: Form(
                  key: homeCtrl.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                        child: TextFormField(
                          controller: homeCtrl.editTaskCtrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Enter Task Title"),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return '*Please enter your task title';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                        child: Wrap(
                          spacing: 2.0.wp,
                          children: icons
                              .map((e) => Obx(() {
                                    final index = icons.indexOf(e);
                                    return ChoiceChip(
                                      selectedColor: Colors.grey[200],
                                      pressElevation: 0,
                                      backgroundColor: Colors.white,
                                      label: e,
                                      selected:
                                          homeCtrl.chipIndex.value == index,
                                      onSelected: (bool sel) {
                                        homeCtrl.chipIndex.value =
                                            sel ? index : 0;
                                      },
                                    );
                                  }))
                              .toList(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (homeCtrl.formKey.currentState!.validate()) {
                            int icon =
                                icons[homeCtrl.chipIndex.value].icon!.codePoint;
                            String color =
                                icons[homeCtrl.chipIndex.value].color!.toHex();
                            var task = Task(
                                title: homeCtrl.editTaskCtrl.text,
                                icon: icon,
                                color: color);
                            print("Task :- $task");
                            Get.back();
                            homeCtrl.addTask(task)
                                ? EasyLoading.showSuccess(
                                    "Task created successfully")
                                : EasyLoading.showError(
                                    "Task already existing");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(150, 40),
                        ),
                        child: Text(
                          'Submit',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.white),
                        ),
                      )
                    ],
                  ))
          );
          //?? should be clear the task & icon index should be zero
          // after dialog is closed
          homeCtrl.editTaskCtrl.clear();
          homeCtrl.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: const [8, 4],
          child: Center(
              child: Icon(
            addIcon,
            color: Colors.grey,
            size: 10.0.wp,
          )),
        ),
      ),
    );
  }
}
