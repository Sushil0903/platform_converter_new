import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/detail_provider.dart';
import 'package:provider/provider.dart';

class Iospage2 extends StatefulWidget {
  const Iospage2({super.key});

  @override
  State<Iospage2> createState() => _Iospage2State();
}

class _Iospage2State extends State<Iospage2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<detailprovider>(
      builder: (BuildContext context, detailprovider value, Widget? child) {
        return CupertinoPageScaffold(child: ListView.builder(
        itemCount: value.userlist.length,
        itemBuilder: (context, index) {
        return CupertinoListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(
              File(value.userlist[index].img.toString()),
            ),
          ),
          leadingSize: 40,
          title: Text("${value.userlist[index].name}",style: TextStyle(fontSize: 20),),
          subtitle: Text("${value.userlist[index].chat}",style: TextStyle(fontSize: 15),),
          trailing: Text(
              "${value.userlist[index].mdate?.day}/${value.userlist[index].mdate?.month}/${value.userlist[index].mdate?.year},${value.userlist[index].mtime?.hour}:${value.userlist[index].mtime?.minute}"),
        );
      },));
      },
    );
  }
}
