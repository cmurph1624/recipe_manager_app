import 'package:flutter/material.dart';
import 'package:recipe_manager_app/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipeDetail;

  RecipeCard({@required this.recipeDetail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              elevation: 5,
              child: Container(
                  height: MediaQuery.of(context).size.width * 0.33,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(children: <Widget>[
                    ListTile(
                      title: Text(recipeDetail.recipeTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              fontStyle: FontStyle.italic)),
                      subtitle: Text(recipeDetail.recipeDescription,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                          ))
                    )
                  ])),
            )));
  }
}
