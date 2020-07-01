
import 'package:FoodStack/bloc/getResultsBloc.dart';
import 'package:FoodStack/model/result_model.dart';
import 'package:FoodStack/model/resultmodelresponse.dart';
import 'package:FoodStack/screens/detailsScreen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  String query;

  ResultScreen(this.query);
  @override
  _ResultScreenState createState() => _ResultScreenState(query);
}

class _ResultScreenState extends State<ResultScreen> {
  String query;
  _ResultScreenState(this.query);

  @override
  void initState() {
    super.initState();
    getresultbloc.getResultBloc(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21bfbd),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'You Searched For',
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'Poppins'),
                ),
                SizedBox(
                  width: 8,
                ),
                query.length > 10
                    ? Text(
                        query.substring(0, 7) + '..',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Poppins'),
                      )
                    : Text(
                        query,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Poppins'),
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(95))),
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: StreamBuilder(
                  stream: getresultbloc.subject.stream,
                  builder:
                      (context, AsyncSnapshot<ResultModelResponse> snapshot) {
                    if (snapshot.hasData) {
                      return _homeWidget(snapshot.data);
                    } else if (snapshot.hasError) {
                      return _error(snapshot.error);
                    } else {
                      return _loading();
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget _loading() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              strokeWidth: 4,
            ),
          )
        ],
      ),
    );
  }

  Widget _error(String error) {
    return Container(
      child: Text(error),
    );
  }

  Widget _homeWidget(ResultModelResponse response) {
    List<ResultModel> results = response.results;
    if (results.length == 0) {
      return Container(
        child: Text('No Results found'),
      );
    } else {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: results.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
             
              return GestureDetector(
                onTap:()=> Navigator.push(context, MaterialPageRoute(builder:(_)=> DetailScreen(results[index].id))),
                              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 25)
                          ],
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://spoonacular.com/recipeImages/' +
                                      results[index].image),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          results[index].title,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      );
    }
  }
}
