import 'package:FoodStack/model/getTodaysspecialResponse.dart';
import 'package:FoodStack/repository/recipie_repository.dart';
import 'package:rxdart/rxdart.dart';

class TodaySpecialBloc{
  RecipieRepository recipieRepository = RecipieRepository();
  BehaviorSubject<TodaySpecialResponse> behaviorSubject = BehaviorSubject<TodaySpecialResponse>();

  getTodaySpecial() async{
    TodaySpecialResponse todaySpecialResponse = await recipieRepository.getTodaySpecial();
    behaviorSubject.sink.add(todaySpecialResponse);
  }
  dispose(){
    behaviorSubject.close();
  }

  BehaviorSubject<TodaySpecialResponse> get subject => behaviorSubject;
}

final getTodaySpecialbloc = TodaySpecialBloc();