import 'package:FoodStack/bloc/random_recipie_bloc.dart';
import 'package:FoodStack/model/random_recipies.dart';
import 'package:FoodStack/model/random_recipies_response.dart';
import 'package:FoodStack/screens/detailsScreen.dart';
import 'package:flutter/material.dart';

class getRandomCard extends StatefulWidget {
  @override
  _getRandomCardState createState() => _getRandomCardState();
}

class _getRandomCardState extends State<getRandomCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrecipiebloc.getRecipies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          StreamBuilder(
              stream: getrecipiebloc.subject.stream,
              builder: (context, AsyncSnapshot<RecipieResponse> snapshot) {
                if (snapshot.hasData) {
                  return _buildRandomRecipies(snapshot.data);
                } else if (snapshot.hasError) {
                  return _loading();
                } else {
                  return _loading();
                }
              })
        ],
      ),
    );
  }

  Widget _loading() {
    return Padding(
      padding: EdgeInsets.only(top: 200),
      child: Center(
        child: Container(
            child: SizedBox(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        )),
      ),
    );
  }

  Widget _error(String e) {
    return Container(
      child: Center(child: Text(e)),
    );
  }

  Widget _buildRandomRecipies(RecipieResponse recipieResponse) {
    List<Recipies> movie = recipieResponse.recipies;
    if (movie.length == 0) {
      return Container(
        child: Column(
          children: <Widget>[Text('No Recipie Present')],
        ),
      );
    } else {
      return Container(
        height: 150,
        margin: EdgeInsets.only(top: 220),
        padding: EdgeInsets.only(left: 10),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movie.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap:()=> Navigator.push(context, MaterialPageRoute(builder:(_)=>DetailScreen(movie[index].id) )),
                              child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 8, bottom: 8),
                  child: Container(
                      width: 225,
                      decoration: BoxDecoration(
                          color: Color(0xfffbf7f5).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 8)
                          ]),
                      child: Row(
                        children: <Widget>[
                          movie[index].imageURL == null
                              ? Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                      width: 85,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.image)),
                                )
                              : Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(movie[index].imageURL),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              movie[index].title.length > 20
                                  ? Container(
                                      width: 100,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Text(
                                          movie[index].title.substring(0, 17) +
                                              '...',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins'),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 100,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Text(
                                          movie[index].title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins'),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                color: Colors.amber,
                                width: 75,
                                height: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/vegetarian.png'))),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.amber),
                                    child: Center(
                                      child: Text(
                                        movie[index].source,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )),
                ),
              );
            }),
      );
    }
  }
}
