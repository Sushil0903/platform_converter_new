import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter/controller/detail_provider.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController namecontrol = TextEditingController();
  TextEditingController phonecontrol = TextEditingController();
  TextEditingController chatcontrol = TextEditingController();
  GlobalKey<FormState> fkey = GlobalKey();
  String? xfile;
  var date;
  var time;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: fkey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () async{
                  XFile? Simg =
                  await ImagePicker().pickImage(source: ImageSource.camera);
                  xfile = Simg?.path ?? "";
                  setState(() {

                  });
                },
                child: CircleAvatar(
                  backgroundImage: FileImage(File(xfile??"")),
                  radius: 60,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextFormField(
                controller: namecontrol,
                decoration: InputDecoration(
                    labelText: "Full name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_circle)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name is required";
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextFormField(
                controller: phonecontrol,
                decoration: InputDecoration(
                    labelText: "Phone number",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone number is required";
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextFormField(
                controller: chatcontrol,
                decoration: InputDecoration(
                    labelText: "Chat Conversation",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.chat)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Chat is required";
                  }
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async{
                date= await showDatePicker(
                    context: context, firstDate: DateTime.now(), lastDate: DateTime(2050));

              },
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Pick Date")
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async{
                 time=await showTimePicker(
                    context: context, initialTime: TimeOfDay(hour: 2, minute: 50));
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.timer_sharp),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Pick Time")
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    bool valid=fkey.currentState?.validate()??false;
                    if(valid)
                      {
                        Provider.of<detailprovider>(context, listen: false).addtolist(date,time,xfile??"" , namecontrol.text,phonecontrol.text, chatcontrol.text,);
                      }
                  },
                  child: Text("Save"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
