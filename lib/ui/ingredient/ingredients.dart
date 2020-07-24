// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:recipe_manager_app/models/ingredient.dart';
// import 'package:recipe_manager_app/providers/ingredient_provider.dart';

// class IngredientsView extends StatefulWidget {
//   IngredientsView({Key key}) : super(key: key);
//   @override
//   _IngredientsViewState createState() => _IngredientsViewState();
// }

// class _IngredientsViewState extends State<IngredientsView> {
//     final ingredientProvider = Provider.of<IngredientProvider>(context);
//     List<Ingredient> _ingredients = new List<Ingredient>();

//     @override
//     void initState() {
//       super.initState();
//       _ingredients = ingredientProvider.fetchIngredient();
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Container(
//           child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: SizedBox(
//                     height: MediaQuery.of(context).size.width * 0.85,
//                     child: new ListView.builder(
//                       itemCount:
//                           (_ingredients == null) ? 0 : _ingredients.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                             onTap: () {},
//                             child: Card(
//                                 child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: ListTile(
//                                       leading: Container(
//                                         padding: EdgeInsets.only(right: 12.0),
//                                         decoration: new BoxDecoration(
//                                             border: new Border(
//                                                 right: new BorderSide(
//                                                     width: 1.0,
//                                                     color: Colors.white24))),
//                                         child: Text(
//                                             '${_ingredients[index].displayWholeNumber} ${_ingredients[index].displayFraction} ${_ingredients[index].displayUOM}'),
//                                       ),
//                                       title:
//                                           Text(_ingredients[index].description),
//                                     ))));
//                       },
//                     )),
//               )
//             ],
//           )
//         ],
//       ));
//     }
//   }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_manager_app/models/ingredient.dart';
import 'package:recipe_manager_app/providers/ingredient_provider.dart';

class IngredientItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ingredientProvider = Provider.of<IngredientProvider>(context);
    List<Ingredient> _ingredients = new List<Ingredient>();
    _ingredients = ingredientProvider.fetchIngredient();

    return Container(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.85,
                  child: new ListView.builder(
                    itemCount: (_ingredients == null) ? 0 : _ingredients.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {},
                          child: Card(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: Container(
                                      padding: EdgeInsets.only(right: 12.0),
                                      decoration: new BoxDecoration(
                                          border: new Border(
                                              right: new BorderSide(
                                                  width: 1.0,
                                                  color: Colors.white24))),
                                      child: Text(
                                          '${_ingredients[index].displayWholeNumber} ${_ingredients[index].displayFraction} ${_ingredients[index].displayUOM}'),
                                    ),
                                    title:
                                        Text(_ingredients[index].description),
                                  ))));
                    },
                  )),
            )
          ],
        )
      ],
    ));
  }
}
