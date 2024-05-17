import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter/class.dart';

class detailprovider extends ChangeNotifier{
  List<Contactmodel> userlist=[];


  void addtolist(var date,var time,String img,String name,String number,String chat)
  {
          userlist.add(Contactmodel(mdate: date,mtime: time,img: img,name: name,number: number,chat: chat));
          notifyListeners();
  }
}