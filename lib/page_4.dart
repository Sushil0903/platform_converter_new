

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter/controller/main_provider.dart';
import 'package:provider/provider.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
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
    return Scaffold(
        body: SingleChildScrollView(
      child: Consumer<MainProvider>(
        builder: (BuildContext context, MainProvider value, Widget? child) =>
            Column(
          children: [
            ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                subtitle: Text("Update profile data"),
                title: Text(
                  "Profile",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Switch(
                  value: value.isProfile??false,
                  onChanged: (value) {
                    Provider.of<MainProvider>(context, listen: false)
                        .showProfile(value);
                  },
                )),
            Visibility(
              visible: Provider.of<MainProvider>(context).isProfile ?? false,
              child: Container(
                height: 350,
                // color: CupertinoColors.white,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Show dialog to choose between camera or gallery
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Choose Image Source",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListBody(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          XFile? file = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);

                                          if (file != null) {
                                            // Do something with the captured image file
                                            // For example, you can set it to the provider
                                            Provider.of<MainProvider>(context,
                                                    listen: false)
                                                .setImage(file.path);
                                            Navigator.pop(context);
                                          } else {
                                            // Handle if the user cancels capturing the image
                                            print(
                                                'User cancelled capturing image Camera');
                                          }
                                        },
                                        child: Text(
                                          "Camera",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      Divider(),
                                      GestureDetector(
                                        onTap: () async {
                                          XFile? file = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          if (file != null) {
                                            // Do something with the captured image file
                                            // For example, you can set it to the provider
                                            Provider.of<MainProvider>(context,
                                                    listen: false)
                                                .setImage(file.path);
                                            Navigator.pop(context);
                                          } else {
                                            print(
                                                'User cancelled capturing image Gallery');
                                          }
                                          setState(() {});
                                        },
                                        child: Text(
                                          "Gallery",
                                          style: TextStyle(fontSize: 17),
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
                          Consumer<MainProvider>(
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return CircleAvatar(
                                radius: 50,
                                backgroundColor: Provider.of<MainProvider>(
                                            context,
                                            listen: false)
                                        .isImage
                                    ? Colors.blue
                                    : null,
                                // backgroundImage: Provider.of<MainProvider>(context).isImage ? null : FileImage(
                                //         File(value.XFile ?? "Image_NOT_Found"),),
                              );
                            },
                          ),
                          Positioned(
                            top: 65,
                            left: 65,
                            // bottom: 20,
                            child: IconButton(
                              icon: Icon(
                                Icons.add_circle,
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
                      padding:
                          const EdgeInsets.only(top: 5, left: 30, right: 30),
                      child: TextFormField(
                        controller: ProfileNameController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          label: Text("Name"),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, bottom: 5),
                      child: TextFormField(
                        controller: ProfileBioController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          label: Text("Bio"),
                        ),
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
                            Provider.of<MainProvider>(context, listen: false)
                                .clearImage();
                          },
                          child: Text(
                            "Reset",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // String? ProfileName = ProfileNameController.text;
                            if (ProfileNameController.text.isNotEmpty &&
                                ProfileBioController.text.isNotEmpty) {
                              Provider.of<MainProvider>(context, listen: false)
                                  .setProfile(ProfileNameController.text,
                                      ProfileBioController.text);

                              // Show dialog indicating that data is saved
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Saved !!!"),
                                    content: Text(
                                        "Your profile data has been saved."),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Close the dialog
                                        },
                                        child: Text("Ok"),
                                      ),
                                    ],
                                  );
                                },
                              );
                              print(
                                  "Name= ${ProfileNameController.text} AND Bio= ${ProfileBioController.text}");
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
              padding: const EdgeInsets.only(right: 20, left: 20, top: 2),
              child: Divider(),
            ),
            ListTile(
              leading: Icon(
                Icons.sunny,
                size: 30,
              ),
              subtitle: Text("Change Theme"),
              title: Text(
                "Theme",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Switch(
                value: Theme ?? false,
                onChanged: (value) {
                  Theme = value;
                  Provider.of<MainProvider>(context, listen: false)
                      .changetheme(value);
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

/*


ListTile(
            leading: Icon(Icons.sunny,size: 30,),
            subtitle: Text("Change Theme"),
            title: Text("Theme",style: TextStyle(fontWeight: FontWeight.bold),),
            trailing: Switch(value: Theme??false,onChanged: (value) {
              Theme=value;
              Provider.of<MainProvider>(context,listen: false
              ).changetheme(value);
            },),
          ),
*/
