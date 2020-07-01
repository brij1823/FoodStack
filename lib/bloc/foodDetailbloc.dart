import 'package:FoodStack/model/fooddetailresponse.dart';
import 'package:FoodStack/repository/recipie_repository.dart';
import 'package:rxdart/rxdart.dart';

class FoodDetailBloc{
  RecipieRepository recipieRepository = RecipieRepository();
  BehaviorSubject<FoodDetailResponse> behaviorSubject  = BehaviorSubject<FoodDetailResponse>();

  getFoodDetail(id) async{
      FoodDetailResponse recipieResponse =await recipieRepository.getDetailScreen(id);
      print(recipieResponse);
      behaviorSubject.sink.add(recipieResponse);
  }
  dispose(){
    behaviorSubject.close();
  }
  BehaviorSubject<FoodDetailResponse> get subject=>behaviorSubject;
}

final fooddetailsbloc = FoodDetailBloc();