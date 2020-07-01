import 'package:FoodStack/model/random_recipies_response.dart';
import 'package:FoodStack/repository/recipie_repository.dart';
import 'package:rxdart/rxdart.dart';

class RandomRecipieBloc {
  RecipieRepository recipieRepository = RecipieRepository();
  BehaviorSubject<RecipieResponse> behaviorSubject =
      BehaviorSubject<RecipieResponse>();

  getRecipies() async {
    RecipieResponse recipieResponse =
        await recipieRepository.getRandomRecipie();
    behaviorSubject.sink.add(recipieResponse);
  }

  dispose() {
    behaviorSubject.close();
  }

  BehaviorSubject<RecipieResponse> get subject => behaviorSubject;
}

final getrecipiebloc = RandomRecipieBloc();
