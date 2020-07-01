import 'package:FoodStack/model/resultmodelresponse.dart';
import 'package:FoodStack/repository/recipie_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetResultsBloc {
  RecipieRepository recipieRepository = RecipieRepository();
  BehaviorSubject<ResultModelResponse> behaviorSubject =
      BehaviorSubject<ResultModelResponse>();

  getResultBloc(String query) async {
    ResultModelResponse response =
        await recipieRepository.getResultMethod(query);
    behaviorSubject.sink.add(response);
  }

  dispose() {
    behaviorSubject.close();
  }

  BehaviorSubject<ResultModelResponse> get subject => behaviorSubject;
}

final getresultbloc = GetResultsBloc();
