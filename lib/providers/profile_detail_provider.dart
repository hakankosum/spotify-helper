
import 'package:ff/models/profile_detail_model.dart';
import 'package:ff/services/profile_details_service.dart';
import 'package:flutter/cupertino.dart';

class ProfileDetailProvider extends ChangeNotifier{
  bool isLoaded=false;
  ProfileDetailModel? data;

  getProfileDetailData() async{
    data=await ProfileDetailService();
    if (data.runtimeType==ProfileDetailModel){
      isLoaded=true;
    }

    notifyListeners();

  }
}