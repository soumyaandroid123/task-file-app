import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_file_app/app/core/commons.dart';
import 'package:task_file_app/app/core/utils/extension.dart';
import 'package:task_file_app/app/core/values/colors.dart';
import 'package:task_file_app/app/core/values/icons.dart';
import 'package:task_file_app/app/core/values/images.dart';
import 'package:task_file_app/app/modules/home/controller.dart';
import 'package:task_file_app/app/modules/home/widgets/add_card.dart';
import 'package:task_file_app/app/modules/home/widgets/task_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final editEmailCtrl = TextEditingController();
  final inviteItems = ['Invite a new team member by email', 'Invite with ink'];
  List<IconData> inviteIconItems = [emailIcon, copyLinkIcon];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: Commons.appBar(context,
              label: 'Welcome Soumya!',
              taskLabel: 'Explore Tasks',
              actions: [
                InkWell(
                  onTap: () {
                    print("object");
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 0.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.grey, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          notifyIcon,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
          body: ListView(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              verticalSpaceLarge,
              inviteTeamMembers(context),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'My Task List',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.white),
                ),
              ),
              Obx(
                () => GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    ...controller.tasks
                        .map((element) => TaskCard(task: element))
                        .toList(),
                    AddCard()
                  ],
                ),
              ),
            ],
          )),
    );
  }

  // ?? invite team members
  Widget inviteTeamMembers(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey[800], shape: BoxShape.circle),
                child: Icon(
                  starIcon,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Invite Team Members',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black),
                  ),
                  verticalSpaceSmall,
                  inviteIconMemList()
                ],
              )
            ],
          ),
        ),
        Positioned(
            bottom: 15,
            right: 15,
            child: InkWell(
              onTap: () => inviteBottomSheet(context),
              child: Container(
                decoration: BoxDecoration(
                    color: blue, borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(10),
                child: Icon(
                  fwdIcon,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }

  //?? invite icon members item
  Widget inviteIconMemItem(String image) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        color: colorSelectionFunction(image),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset("$image"),
      ),
    );
  }

  //?? invite icon members item list
  Widget inviteIconMemList() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        inviteIconMemItem(avOneImg),
        horizontalSpaceSmall,
        inviteIconMemItem(avTwoImg),
        horizontalSpaceSmall,
        inviteIconMemItem(avThreeImg),
        horizontalSpaceSmall,
        inviteIconMemItem(avFourImg),
        horizontalSpaceSmall,
        inviteIconMemItem(avFiveImg),
        horizontalSpaceSmall,
      ],
    );
  }

  // ?? invite bottomSheet
  inviteBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => inviteBuildSheet(context));
  }

  //?? invite member build sheet
  Widget inviteBuildSheet(BuildContext context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.3,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )),
            child: Column(
              children: [
                verticalSpaceMedium,
                Text(
                  "Invite",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0.sp,
                      color: Colors.black),
                ),
                verticalSpaceRegular,
                ListView.builder(
                  itemCount: inviteItems.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            editEmailCtrl.clear();
                            emailBottomSheet(context);
                          },
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  shape: BoxShape.circle),
                              child: Icon(
                                inviteIconItems[index],
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            title: Text(
                              inviteItems[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                      color: Colors.black),
                            ),
                          ),
                        ),
                        Divider(), //                           <-- Divider
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );

  // ?? email bottomSheet
  emailBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => emailBuildSheet(context));
  }

  //?? email build sheet
  Widget emailBuildSheet(BuildContext context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: DraggableScrollableSheet(
          initialChildSize: 0.41,
          minChildSize: 0.41,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  verticalSpaceMedium,
                  Text(
                    "Invite Team Members",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0.sp,
                        color: Colors.black),
                  ),
                  verticalSpaceRegular,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                    child: TextFormField(
                      controller: editEmailCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter Email"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '*Please enter email';
                        }
                        return null;
                      },
                    ),
                  ),
                  verticalSpaceRegular,
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        try {
                          Uri _emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: editEmailCtrl.text,
                              queryParameters: {'subject': ''});
                          launch(_emailLaunchUri.toString());
                        } catch (exception) {
                          print(exception);
                        }
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
                      'Invite',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
