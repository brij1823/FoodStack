
import 'package:FoodStack/model/fooddetailresponse.dart';
import 'package:FoodStack/model/getTodaysspecialResponse.dart';
import 'package:FoodStack/model/random_recipies_response.dart';
import 'package:FoodStack/model/resultmodelresponse.dart';
import 'package:dio/dio.dart';

class RecipieRepository {
  static String mainURL = 'https://api.spoonacular.com/';
  String apiKey = '5a7f9dc672324110b55e2f5b334c95a7';
  String randomRecipie = '$mainURL/recipes/random';
  String searchRecipie = '$mainURL/recipes/search';
  String detailScreen = '$mainURL/recipes/';
  Dio dio = Dio();

  getRandomRecipie() async {
    var params = {"apiKey": apiKey, "tags": "vegetarian", "number": 10};

    try {
      Response response = await dio.get(randomRecipie, queryParameters: params);
      return RecipieResponse.jsonDecode(response.data);
    } catch (e) {
      return RecipieResponse.withErrors(e);
    }
  }

  getTodaySpecial() async {
    var params = {"apiKey": apiKey, "tags": "vegetarian", "number": 1};
    try {
      Response response = await dio.get(randomRecipie, queryParameters: params);
      return TodaySpecialResponse.jsonDecode(response.data);
    } catch (e) {
      return TodaySpecialResponse.withError(e);
    }
  }

  getResultMethod(String query) async {
    var params = {"apiKey": apiKey, "query": query, "number": 15};

    try {
      Response response = await dio.get(searchRecipie, queryParameters: params);
      return ResultModelResponse.jsonDecode(response.data);
    } catch (e) {
      return ResultModelResponse.withError(e);
    }
  }

  getDetailScreen(int id) async{
    var params = {
      "apiKey":apiKey
    };

    try{
      print(detailScreen+'/$id/'+'information');
      Response response = await dio.get(detailScreen+'/$id/'+'information?includeNutrition=true',queryParameters: params);
      print(response);
      return FoodDetailResponse.jsonDecode(response.data);
    }
    catch(e){
      return FoodDetailResponse.errorWith(e);
    }
  }
}
