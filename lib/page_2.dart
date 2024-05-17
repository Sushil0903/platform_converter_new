import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_converter/controller/detail_provider.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<detailprovider>(
        builder: (BuildContext context, detailprovider value, Widget? child) {
          return ListView.builder(
            itemCount: value.userlist.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: FileImage(
                    File(value.userlist[index].img.toString()),
                  ),
                ),
                subtitle: Text("${value.userlist[index].chat}"),
                title: Text("${value.userlist[index].name}"),
                trailing: Text(
                    "${value.userlist[index].mdate?.day}/${value.userlist[index].mdate?.month}/${value.userlist[index].mdate?.year},${value.userlist[index].mtime?.hour}:${value.userlist[index].mtime?.minute}"),
              );
            },
          );
        },
      ),
    );
  }
}
