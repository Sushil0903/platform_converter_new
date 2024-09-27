import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../controller/main_provider.dart';

class Iospage4 extends StatefulWidget {
  const Iospage4({super.key});

  @override
  State<Iospage4> createState() => _Iospage4State();
}

class _Iospage4State extends State<Iospage4> {
  TextEditingController ProfileNameController = TextEditingController();
  TextEditingController ProfileBioController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize text controllers with values from the provider
    ProfileNameController.text =
        Provider.of<MainProvider>(context, listen: false).ProfileName ?? '';
    ProfileBioController.text =
        Provider.of<MainProvider>(context, listen: false).ProfileBio ?? '';
  }
  bool? Theme;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Consumer<MainProvider>(
          builder: (BuildContext context, MainProvider value, Widget? child) => Column(children: [
                CupertinoListTile(
            leading: Icon(CupertinoIcons.person,size: 30,),
            subtitle: Text("Update profile data"),
            title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold),),
            trailing: CupertinoSwitch(
              value: value.isProfile??false,
              onChanged: (value) {
              Provider.of<MainProvider>(context, listen: false)
                  .showProfile(value);

            },)
                ),
                Visibility(
          visible:
          Provider.of<MainProvider>(context).isProfile ??
              false,
          child: Container(
            height: 300,
            child: Column(
              children: [
                CupertinoButton(
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text(
                            "Choose Image Source",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: Padding(
                              padding:
                              const EdgeInsets.all(8.0),
                              child: ListBody(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      XFile? file =
                                      await ImagePicker()
                                          .pickImage(
                                          source:
                                          ImageSource
                                              .camera);

                                      if (file != null) {
                                        Provider.of<MainProvider>(
                                            context,
                                            listen: false)
                                            .setImage(
                                            file.path);
                                        Navigator.pop(context);
                                      } else {
                                        print(
                                            'User cancelled capturing image Camera');
                                      }
                                    },
                                    child: Text(
                                      "Camera",
                                      style: TextStyle(
                                          fontSize: 17),
                                    ),
                                  ),
                                  Divider(),
                                  GestureDetector(
                                    onTap: () async {
                                      XFile? file =
                                      await ImagePicker()
                                          .pickImage(
                                          source: ImageSource
                                              .gallery);
                                      if (file != null) {
                                        Provider.of<MainProvider>(
                                            context,
                                            listen: false)
                                            .setImage(
                                            file.path);
                                        Navigator.pop(context);
                                      } else {
                                        print(
                                            'User cancelled capturing image Gallery');
                                      }
                                    },
                                    child: Text(
                                      "Gallery",
                                      style: TextStyle(
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor:
                        Provider.of<MainProvider>(context)
                            .isImage
                            ? CupertinoColors.activeBlue
                            : null,
                        backgroundImage:
                        Provider.of<MainProvider>(context)
                            .isImage
                            ? null
                            : FileImage(File(value.XFile ??
                            "Image_NOT_Found")),
                      ),
                      Positioned(
                        top: 60,
                        left: 60,
                        // bottom: 20,
                        child: CupertinoButton(
                          child: Icon(
                            CupertinoIcons.add_circled_solid,
                            // color: Colors.blue,
                            size: 25,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 30, right: 30, bottom: 15),
                  child: CupertinoTextField(
                    controller: ProfileNameController,
                    decoration: BoxDecoration(
                      color: CupertinoColors.lightBackgroundGray
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    placeholder: "Name",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, bottom: 20),
                  child: CupertinoTextField(
                    controller: ProfileBioController,
                    decoration: BoxDecoration(
                      color: CupertinoColors.lightBackgroundGray
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    placeholder: "Bio",
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        ProfileNameController.clear();
                        ProfileBioController.clear();
                        Provider.of<MainProvider>(context,
                            listen: false)
                            .clearImage();
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    TextButton(
                      onPressed: () {

                        if (ProfileNameController
                            .text.isNotEmpty &&
                            ProfileBioController
                                .text.isNotEmpty) {
                          Provider.of<MainProvider>(context,
                              listen: false)
                              .setProfile(
                              ProfileNameController.text,
                              ProfileBioController.text);

                          showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoActionSheet(
                                  title: Text("Saved!!!"),
                                  cancelButton:
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ok"),
                                  ),
                                );
                              });
                        } else {
                          print("Field is Blank");
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
                ),






                Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 2),
          child: Divider(),
                ),
                CupertinoListTile(
            leading: Icon(CupertinoIcons.sun_min,size: 30,),
            subtitle: Text("Change theme"),
            title: Text("Theme",style: TextStyle(fontWeight: FontWeight.bold),),
            trailing: CupertinoSwitch(value: Theme??false,onChanged: (value) {
              Theme=value;
              Provider.of<MainProvider>(context,listen: false
              ).changetheme(value);
            },)
                ),
              ],),
        ));
  }
}
