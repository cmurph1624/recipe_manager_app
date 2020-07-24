

import 'package:flutter/material.dart';
import 'package:recipe_manager_app/ui/Recipe/recipe.dart';
import 'package:recipe_manager_app/ui/Recipe/recipedetail.dart';
import 'package:recipe_manager_app/ui/Recipe/recipeitem.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_)=> RecipeView() );
      case '/addRecipe':
        return MaterialPageRoute(
          builder: (_) => AddRecipe() );
      case '/recipe':
        return MaterialPageRoute(
          builder: (_) => AddRecipe() );
      case '/recipeitem':
        return MaterialPageRoute(
          builder: (_) => RecipeItem());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}')
            )
          ));
    }
  }
}