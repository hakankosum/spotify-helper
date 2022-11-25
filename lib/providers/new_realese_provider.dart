

import 'package:ff/models/new_realese_model.dart';
import 'package:ff/services/new_realese_service.dart';
import 'package:flutter/material.dart';

class GetNewRealeseProvider extends ChangeNotifier{
  GetNewRealeseModel? new_realese_song;

  bool isNewSongLoaded =false;


  getNewRealeseSong () async {
    new_realese_song = await GetNewRealeseService();
    if (new_realese_song.runtimeType==GetNewRealeseModel){
      isNewSongLoaded=true;  
      notifyListeners();    
    }
    else{
      
      
    }
    
    
    
  }
}