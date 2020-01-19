

import 'package:flutter/material.dart';
import 'package:recipe_manager_app/ui/Recipe/recipe.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_)=> RecipeView() );
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