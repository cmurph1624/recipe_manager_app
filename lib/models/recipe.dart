class Recipe{
  String id;
  String recipeTitle;
  String recipeDescription;

  Recipe(this.id, this.recipeDescription, this.recipeTitle);

  Recipe.fromMap(Map snapshot,String id) :
    id = id ?? '',
    recipeTitle = snapshot['title'] ?? '',
    recipeDescription = snapshot['Description'] ?? '';

  toJson() {
    return {
      "title": recipeTitle,
      "Description": recipeDescription
    };
  }
}