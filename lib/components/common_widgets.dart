import 'package:flutter/material.dart';

class CommonWidgets{
  showSnackBar({required BuildContext context,required Color color, String? title}){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title??"Something went wrong, Please try again later"),backgroundColor: color,));
  }
}