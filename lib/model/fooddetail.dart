import 'package:flutter/cupertino.dart';

class FoodDetail{
  int id;
  String title;
  String imageURL;
  double servings;
  String readmore;
  double price;
  String sourceName;
  double readyIn;
  var weight;
  var calorie;
  double fat;
  double protien;
  FoodDetail(this.id,this.title,this.imageURL,this.price,this.readmore,this.servings,this.sourceName,this.readyIn,this.weight,this.calorie);

  FoodDetail.jsonDecode(Map<String,dynamic> json):
  id = json["id"],
  title = json["title"],
  imageURL = json["image"],
  servings = json["servings"].toDouble(),
  readmore = json["sourceUrl"],
  price = json["pricePerServing"].toDouble(),
  sourceName = json["sourceName"],
  calorie=(json["nutrition"]["nutrients"] as List).map((e) => e["title"]=="Calories"?e["amount"]:0),
  readyIn = json["readyInMinutes"].toDouble();

}