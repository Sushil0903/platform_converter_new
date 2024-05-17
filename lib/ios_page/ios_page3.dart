import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/detail_provider.dart';

class Iospage3 extends StatefulWidget {
  const Iospage3({super.key});

  @override
  State<Iospage3> createState() => _Iospage3State();
}

class _Iospage3State extends State<Iospage3> {
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
              subtitle: Text("${value.userlist[index].number}",style: TextStyle(fontSize: 15),),
              trailing: Icon(CupertinoIcons.phone,color: Colors.green,size: 35,)
            );
          },));
      },
    );
  }
}
