class Ingredient{
  String id;
  int baseQty;
  int displayWholeNumber;
  String displayFraction;
  String displayUOM;
  String description;

  Ingredient(this.id, this.baseQty, this.displayWholeNumber, this.displayFraction, this.description, this.displayUOM);

  Ingredient.fromMap(Map snapshot, String id) :
    id = id ?? '',
    baseQty = snapshot['baseQty'],
    displayUOM = snapshot['displayUOM'],
    description = snapshot['description'];
    
  toJson(){
    return {
      "id": id,
      "baseQty": baseQty,
      "displayUOM": displayUOM,
      "description": description
    };
  }

}