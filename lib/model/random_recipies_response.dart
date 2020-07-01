import 'package:FoodStack/model/random_recipies.dart';

class RecipieResponse {
  List<Recipies> recipies;
  String errors;

  RecipieResponse(this.recipies, this.errors);

  RecipieResponse.jsonDecode(Map<String, dynamic> json)
      : recipies = (json["recipes"] as List)
            .map((e) => Recipies.jsonDecode(e))
            .toList(),
        errors = "";

  RecipieResponse.withErrors(String errorVal)
      : recipies = List(),
        errors = errorVal;
}
