class Recipies {
  int id;
  String title;
  String imageURL;
  bool vegetarian;
  double healthScore;
  double readTime;
  String source;

  Recipies(this.id, this.title, this.imageURL, this.vegetarian,
      this.healthScore, this.readTime, this.source);

  Recipies.jsonDecode(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        imageURL = json["image"],
        vegetarian = json["vegetarian"],
        healthScore = json["healthScore"].toDouble(),
        readTime = json["readyInMinutes"].toDouble(),
        source = json["sourceName"];
}
