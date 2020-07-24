import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_manager_app/models/ingredient.dart';
import 'package:recipe_manager_app/services/recipe_api.dart';

class IngredientProvider with ChangeNotifier{
  List<Ingredient> ingredientList = new List<Ingredient>();
  RecipeApi _api = new RecipeApi("ingredient");

  Stream<QuerySnapshot> fetchIngredientStream(){
    return _api.getStreamDataCollection();
  }

  List<Ingredient> fetchIngredient(){
    
  }
}