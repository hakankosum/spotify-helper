import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier{
  List<Color> colors =[Colors.grey,Colors.grey,Colors.grey,Colors.grey,] ;
  int isSelected=0;

  paintSelectedIcon(index){
    for (var i = 0; i < colors.length; i++) {
      if (i==index){
        colors[i]=Colors.green;
      }
      else{
        colors[i]=Colors.grey;
      }
      
    }
    notifyListeners();
     
  }
}