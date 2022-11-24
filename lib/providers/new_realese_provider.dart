

import 'package:ff/models/new_realese_model.dart';
import 'package:ff/services/get_new_realese_service.dart';
import 'package:flutter/material.dart';

class GetNewRealeseProvider extends ChangeNotifier{
  GetNewRealeseModel? new_realese_song;

  bool is_new_realese_song_loaded =false;


  getNewRealeseSong () async {
    new_realese_song = await GetNewRealeseService();
    if (new_realese_song.runtimeType==GetNewRealeseModel){
      is_new_realese_song_loaded=true;  
      notifyListeners();    
    }
    else{
      
      
    }
    
    
    
  }
}