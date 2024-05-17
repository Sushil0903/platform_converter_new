import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../controller/detail_provider.dart';

class Iospage1 extends StatefulWidget {
  const Iospage1({super.key});

  @override
  State<Iospage1> createState() => _Iospage1State();
}

class _Iospage1State extends State<Iospage1> {
  TextEditingController namecontrol = TextEditingController();
  TextEditingController phonecontrol = TextEditingController();
  TextEditingController chatcontrol = TextEditingController();
  GlobalKey<FormState> fkey = GlobalKey();
  String? xfile;
  var date;
  var time;
  CupertinoThemeData Tform=CupertinoThemeData(brightness: Brightness.light);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child:  Form(
        key: fkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () async{
                XFile? Simg =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                xfile = Simg?.path ?? "";
                setState(() {

                });
              },
              child: CircleAvatar(
                radius: 60,
                child: Icon(CupertinoIcons.camera),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CupertinoTextFormFieldRow(
                controller: namecontrol,
                prefix: Icon(CupertinoIcons.person,size: 30,),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CupertinoTextFormFieldRow(
                controller: phonecontrol,
                prefix: Icon(CupertinoIcons.phone,size: 30,),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CupertinoTextFormFieldRow(
                controller: chatcontrol,
                prefix: Icon(CupertinoIcons.chat_bubble_2,size: 30,),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 8),
              child: Row(
                children: [
                  Icon(CupertinoIcons.calendar,size: 30,),
                  SizedBox(width: 10,),
                  Text("Pick date",style: TextStyle(fontSize: 18),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async{
                           await SizedBox(
                              height: 200,
                              child: await CupertinoDatePicker(onDateTimeChanged: (value) {

                              },mode: CupertinoDatePickerMode.date,),
                            );
                    },
                      child: Icon(CupertinoIcons.time,size: 30,)),
                  SizedBox(width: 10,),
                  Text("Pick time",style: TextStyle(fontSize: 18),)
                ],
              ),
            ),
            CupertinoButton(child: Text("save"), onPressed: () {
              bool valid=fkey.currentState?.validate()??false;
              if(valid)
              {
                Provider.of<detailprovider>(context, listen: false).addtolist(date,time,xfile??"" , namecontrol.text,phonecontrol.text, chatcontrol.text,);
              }
        
            },)
          ],
        ),
      ),
    ),);
  }
}
