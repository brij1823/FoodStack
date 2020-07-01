class getTodaySpecialmodel {
  String imagURL;
  int id;
  String title;
  getTodaySpecialmodel(this.imagURL);

  getTodaySpecialmodel.jsonDecode(Map<String, dynamic> data)
      : imagURL = data["image"],
        id = data["id"],
        title = data["title"];
}
