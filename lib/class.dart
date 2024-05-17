import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Contactmodel{
  String? img;
  String? name;
  String? number;
  String? chat;
  DateTime? mdate;
  TimeOfDay? mtime;

  Contactmodel({this.img, this.name, this.number, this.chat,this.mdate,this.mtime});
}