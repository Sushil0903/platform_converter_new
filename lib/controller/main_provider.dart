import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainProvider extends ChangeNotifier{

  String? XFile;
  bool isImage = false;

  void setImage(getImage) {
    XFile = getImage;
  }

  void clearImage() {
    XFile = null;
    isImage = false;
    notifyListeners();
  }

  String? ProfileName;
  String? ProfileBio;

  void setProfile(String Name, String Bio) {
    ProfileName = Name;
    ProfileBio = Bio;
  }
  bool? isProfile;

  void showProfile(isProfile) {
    this.isProfile = isProfile;
    notifyListeners();
  }

  bool isAndroid=Platform.isAndroid;
  int bi=0;
  PageController pageController=PageController();
  PageController pageController1=PageController();
  bool theme=false;

  void changetheme(bool t)
  {
    theme=t;
    notifyListeners();
  }



  CupertinoThemeData iostheme()
  {
    if(theme==false)
      {
        return CupertinoThemeData(brightness: Brightness.light);
      }
    else{
      return CupertinoThemeData(brightness: Brightness.dark);
    }
  }


  ThemeMode gettheme()
  {
      if(theme==false)
        {
          return ThemeMode.light;
        }
      else
        {
          return ThemeMode.dark;
        }
  }


  void chngeplatform (bool C){
    isAndroid=C;
    notifyListeners();
  }

    void changepage(int index)
    {
      bi=index;
      notifyListeners();
    }
}