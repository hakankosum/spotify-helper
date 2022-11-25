

import 'package:ff/models/search_artist_model.dart';
import 'package:ff/services/search_artist_service.dart';
import 'package:flutter/material.dart';

class  SearchArtistProvider extends ChangeNotifier{
  SearchArtistModel? searchArtist;
  bool isLoaded=false;
  String? artistName;

  getArtistList () async {
    searchArtist =await SearchArtistService(artistName!);
    isLoaded=true;
    notifyListeners();

  }
  
}