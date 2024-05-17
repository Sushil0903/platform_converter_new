import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/detail_provider.dart';
import 'package:platform_converter/controller/main_provider.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main()
{
  runApp(Myapp());
}


class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider(),),
        ChangeNotifierProvider(create: (context) => detailprovider(),)
      ],
      builder: (context, child) {
        return  Consumer<MainProvider>(
          builder: (BuildContext context, value, Widget? child) {
            if(value.isAndroid)
              {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData.light(),
                  darkTheme: ThemeData.dark(),
                  themeMode: Provider.of<MainProvider>(context,listen: false).gettheme(),
                  home: Homepage(),
                );

              }
            else
              {
                return CupertinoApp(
                  debugShowCheckedModeBanner: false,
                 theme: Provider.of<MainProvider>(context,listen: false).iostheme(),
                  home: Homepage(),
                );
              }

          },
        );
      },
    );
  }
}
