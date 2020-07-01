import 'package:FoodStack/model/result_model.dart';

class ResultModelResponse {
  List<ResultModel> results;
  String errors;

  ResultModelResponse(this.results, this.errors);

  ResultModelResponse.jsonDecode(Map<String, dynamic> data)
      : results = (data["results"] as List)
            .map((e) => ResultModel.jsonDecode(e))
            .toList(),
        errors = "";

  ResultModelResponse.withError(String errorValue)
      : results = List(),
        errors = errorValue;
}
