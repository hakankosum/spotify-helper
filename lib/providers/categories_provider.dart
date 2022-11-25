// ignore_for_file: non_constant_identifier_names

import 'package:ff/models/categories_model.dart';
import 'package:ff/models/new_realese_model.dart';
import 'package:ff/services/categories_service.dart';
import 'package:ff/services/new_realese_service.dart';
import 'package:flutter/material.dart';

class GetCategoriesProvider extends ChangeNotifier{
  CategoriesModel? categories;

  bool is_categories_loaded =false;


  getCategories () async {
    categories = await GetCategoriesService();
    if (categories.runtimeType==CategoriesModel){
      is_categories_loaded=true;
      
    
    }
    else{
      
    }
    notifyListeners();
    
    
  }
}