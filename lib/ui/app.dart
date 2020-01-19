import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_manager_app/models/recipe.dart';
import 'package:recipe_manager_app/providers/recipe_provider.dart';
import 'package:recipe_manager_app/ui/Recipe/recipe.dart';
import 'package:recipe_manager_app/ui/router.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ],
      child: MaterialApp(
        theme: new ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Recipe App',
        onGenerateRoute: Router.generateRoute,)
      // child: Consumer<RecipeProvider>(
      //   builder: (context, recipe, _){
      //     return MaterialApp(
      //       home: const MyHomePage(),
      //     );
      //   },
      // ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Title()),
      body: const Center(child: CounterLabel()),
      floatingActionButton: const AddNewButton(),
    );
  }
}

class AddNewButton extends StatelessWidget {
  const AddNewButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      onPressed: () {
        Provider.of<RecipeProvider>(context, listen: false).addRecipe();
      },
    );
  }
}

class CounterLabel extends StatelessWidget {
  const CounterLabel({Key key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final rp = Provider.of<RecipeProvider>(context);
    rp.fetchRecipe();
    return ListView.builder(
      itemCount: rp.recipeList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: RecipeCard(rp.recipeList[index]),
        );          //child: Text(rp.recipeList[index].recipeTitle) ,);
      },
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard(this.recipe, {Key key}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            leading: Container(
              padding: EdgeInsets.only(right:12.0),
              decoration: new BoxDecoration(
                border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24)
                )
              ),
              child: Text("${recipe.recipeTitle} ${recipe.recipeDescription}")
            ),
        ),
    ));
  }
}

class Title extends StatelessWidget {
  const Title({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('Recipe App');
  }
}