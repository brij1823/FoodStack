import 'package:FoodStack/model/fooddetail.dart';

class FoodDetailResponse{
  FoodDetail foodDetail = FoodDetail(-1,"","",0,"",0,"",0,{},0);
  String error;

  FoodDetailResponse(this.foodDetail,this.error);

  FoodDetailResponse.jsonDecode(Map<String,dynamic> json):
  foodDetail = FoodDetail.jsonDecode(json),
  error="";

  FoodDetailResponse.errorWith(String e):
  foodDetail = FoodDetail(-1,"","",0,"",0,"",0,{},0),
  error=e;
}