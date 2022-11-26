import 'package:ff/models/profile_playlists_model.dart';
import 'package:ff/services/profile_playlist_service.dart';
import 'package:flutter/cupertino.dart';

class ProfilePlaylistsProvider extends ChangeNotifier{

  bool isLoaded=false;
  ProfilePlaylistsModel? profileData;

  getProfileData() async {
    profileData=await ProfilePlaylistService();
    if (profileData.runtimeType==ProfilePlaylistsModel){
      isLoaded=true;
    }
    notifyListeners(); 

  }
    



}