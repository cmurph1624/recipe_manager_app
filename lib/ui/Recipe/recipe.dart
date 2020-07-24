
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_manager_app/models/recipe.dart';
import 'package:recipe_manager_app/providers/recipe_provider.dart';
import 'package:recipe_manager_app/ui/Recipe/recipecard.dart';

class RecipeView extends StatefulWidget{
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  List<Recipe> recipes;
  
  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
              Navigator.pushNamed(context, '/recipeitem');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: Text('Recipe')),
      ),
      body: Container(
        child: Column(children: <Widget>[
          TextFormField(
            decoration: new InputDecoration(
              labelText: "Search",
              fillColor: Colors.white
            ),
          ),
          Expanded(child: StreamBuilder(
          stream: recipeProvider.fetchRecipeAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              recipes = snapshot.data.documents
              .map((doc) => Recipe.fromMap(doc.data, doc.documentID))
              .toList();
              return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (buildContext, index) =>
                  RecipeCard(recipeDetail: recipes[index])
              );
            } else {
              return Text('fetching');
            }
          }
        )
          
          )
        ],)
        // child: StreamBuilder(
        //   stream: recipeProvider.fetchRecipeAsStream(),
        //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasData) {
        //       recipes = snapshot.data.documents
        //       .map((doc) => Recipe.fromMap(doc.data, doc.documentID))
        //       .toList();
        //       return ListView.builder(
        //         itemCount: recipes.length,
        //         itemBuilder: (buildContext, index) =>
        //           RecipeCard(recipeDetail: recipes[index])
        //       );
        //     } else {
        //       return Text('fetching');
        //     }
        //   }
        // )
      )
    );
  }
}