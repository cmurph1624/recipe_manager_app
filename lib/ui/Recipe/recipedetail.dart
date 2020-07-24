import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_manager_app/providers/recipe_provider.dart';

class AddRecipe extends StatefulWidget {
  @override
  _AddRecipe createState() => _AddRecipe();
}

class _AddRecipe extends State<AddRecipe> {
  final _formKey = GlobalKey<FormState>();
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    var recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text('Add Recipe'),
        )),
        body: Padding(
            padding: EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 10,
                    child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Recipe Title',
                        fillColor: Colors.grey[300]),
                  ) )
                  ,
                  TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Recipe Detail',
                      fillColor: Colors.grey[300],
                      ),
                      )
                ],
              ),
            )));
  }
}
