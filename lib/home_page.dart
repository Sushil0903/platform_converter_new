import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/main_provider.dart';
import 'package:platform_converter/ios_page/ios_page2.dart';
import 'package:platform_converter/ios_page/ios_page3.dart';
import 'package:platform_converter/ios_page/ios_page4.dart';
import 'package:platform_converter/ios_page/iospage1.dart';
import 'package:platform_converter/page_1.dart';
import 'package:platform_converter/page_2.dart';
import 'package:platform_converter/page_3.dart';
import 'package:platform_converter/page_4.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int? iospage;
  @override
  Widget build(BuildContext context) {
    var isAndroid = Provider.of<MainProvider>(context, listen: false).isAndroid;
    if (isAndroid) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Platform Converter"),
          actions: [
            Consumer<MainProvider>(
              builder: (BuildContext context, valu, Widget? child) {
                return Switch(
                  value: valu.isAndroid,
                  onChanged: (value) {
                    valu.chngeplatform(value);
                  },
                );
              },
            )
          ],
        ),
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TabBar(
                // overlayColor: MaterialStatePropertyAll(Colors.red),
                // padding: EdgeInsets.all(5),
                indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: TextStyle(
                  fontSize: 13,
                ),
                automaticIndicatorColorAdjustment: true,
                indicatorPadding: EdgeInsets.only(top: 5, left: 5, right: 5),
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.only(top: 10, left: 5, right: 20),
                labelColor: Colors.blue,
                tabs: [
                  Tab(icon: Icon(Icons.person_add)),
                  Tab(text: "CHATS"),
                  Tab(text: "CALLS"),
                  Tab(text: "SETTINGS"),
                ],
              ),
              Expanded(child: TabBarView(
                children: [
                  Center(child: Page1(),),
                  Center(child: Page2(),),
                  Center(child: Page3(),),
                  Center(child: Page4(),),
                ],
              ))

            ],
          ),
        ),
      );
    }


    else {
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_add), label: "ADD"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2), label: "CHAT"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone), label: "CALLLS"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), label: "SETTINGS"),
          ],

          ),
          tabBuilder: (context, index) {
            return CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: Text("Platform Converter"),
                  trailing: Consumer<MainProvider>(
                    builder: (BuildContext context, MainProvider mainProvider,
                        Widget? child) {
                      return CupertinoSwitch(
                        value: mainProvider.isAndroid,
                        onChanged: (value) {
                          mainProvider.chngeplatform(value);
                        },
                      );
                    },
                  ),
                  stretch: true,
                ),
                SliverFillRemaining(
                  child: PageView(
                    children: [
                        Iospage1(),
                        Iospage2(),
                        Iospage3(),
                        Iospage4(),
                    ],
                  ),
                ),
              ],
            );
            },
          );

    }
  }
}





//
// CupertinoSwitch(
// value: valu.isAndroid,
// onChanged: (value) {
// valu.chngeplatform(value);
// },
// );
