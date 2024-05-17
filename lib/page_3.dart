import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller/detail_provider.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<detailprovider>(
        builder: (BuildContext context, detailprovider value, Widget? child) {
          return ListView.builder(
            itemCount: value.userlist.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(radius: 30,
                  backgroundImage: FileImage(File(value.userlist[index].img.toString()),
                  ),
                ),
                subtitle: Text("${value.userlist[index].number}"),
                title: Text("${value.userlist[index].name}"),
                trailing: InkWell(
                    onTap: () {
                      launchUrl(Uri.parse("tel:${value.userlist[index].number}"));
                    },
                    child: Icon(Icons.phone,color: Colors.green,)),
              );
            },
          );
        },
      ),
    );
  }
}
