import 'package:FoodStack/model/getTodayspecial.dart';

class TodaySpecialResponse {
  List<getTodaySpecialmodel> special;
  String error;

  TodaySpecialResponse(this.special, this.error);

  TodaySpecialResponse.jsonDecode(Map<String, dynamic> data)
      : special = (data["recipes"] as List)
            .map((e) => getTodaySpecialmodel.jsonDecode(e))
            .toList(),
        error = "";

  TodaySpecialResponse.withError(String errorVal)
      : special = List(),
        error = errorVal;
}
