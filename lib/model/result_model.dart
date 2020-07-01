class ResultModel {
  int id;
  String title;
  String image;
  int servings;

  ResultModel(this.id, this.title, this.image, this.servings);

  ResultModel.jsonDecode(Map<String, dynamic> data)
      : id = data["id"],
        title = data["title"],
        image = data["image"],
        servings = data["servings"];
}
