import 'package:FoodStack/screens/resultScreen.dart';
import 'package:FoodStack/widgets/getTodaysspecial.dart';
import 'package:FoodStack/widgets/getrandomrecipi.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchQuery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(height: 300, color: Colors.amber),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 60, left: 15, right: 15),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(35),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Color(0xfffbf7f5),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            this.setState(() {
                              searchQuery = value;
                            });
                          },
                          onSubmitted: (value) {
                         
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ResultScreen(value)));
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            hintText: 'Search Recipies',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(25)),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Container(
                          height: 75,
                          width: 5,
                          color: Colors.orange,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              ('Popular Recipies').toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              ('This Week').toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              getRandomCard(),
            ],
          ),
          getTodaySpecial(),
        ],
      ),
    );
  }
}
