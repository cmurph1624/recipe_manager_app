import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_manager_app/models/recipe.dart';
import 'package:recipe_manager_app/services/recipe_api.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> recipeList = new List<Recipe>();
  RecipeApi _api = new RecipeApi();
  void addRecipe() {

    recipeList.add(new Recipe("1", "Big Cookies", "Cookies"));
    notifyListeners();
  }

  Future<List<Recipe>> fetchRecipe() async{
    var result = await _api.getDataCollection();
    recipeList = 
      result.documents.map((doc) => Recipe.fromMap(doc.data, doc.documentID))
      .toList();
      print(result.documents.first.data);
    return recipeList;
  }

  Stream<QuerySnapshot> fetchRecipeAsStream() {
    return _api.getStreamDataCollection();
  }
}