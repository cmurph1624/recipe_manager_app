


import 'package:flutter/material.dart';
import 'package:recipe_manager_app/models/recipe.dart';
import 'package:recipe_manager_app/ui/ingredient/ingredients.dart';


class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  RecipeItem({@required this.recipe});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Recipe'),
                Tab(text: 'ingredients'),
                Tab(text: 'directions')
              ]
            )
          ),
          body: TabBarView(
            children: [
              IngredientItems()
            ],
          )
        )
      )
    );
  }
}