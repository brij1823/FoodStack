

import 'package:FoodStack/bloc/todaySpecialBloc.dart';
import 'package:FoodStack/model/getTodayspecial.dart';
import 'package:FoodStack/model/getTodaysspecialResponse.dart';
import 'package:FoodStack/screens/detailsScreen.dart';
import 'package:flutter/material.dart';

class getTodaySpecial extends StatefulWidget {
  @override
  _getTodaySpecialState createState() => _getTodaySpecialState();
}

class _getTodaySpecialState extends State<getTodaySpecial> {
  @override
  void initState() {
    super.initState();
    getTodaySpecialbloc.getTodaySpecial();
  }

  static DateTime now = DateTime.now();
  String formattedDate = '${now.day}';
  String formattedMonth = '${now.month}';
  String nameMonth = '';

  String getMonthName() {
    if (formattedMonth == '1') {
      return 'January';
    } else if (formattedMonth == '2') {
      return 'February';
    } else if (formattedMonth == '3') {
      return 'March';
    } else if (formattedMonth == '4') {
      return 'April';
    } else if (formattedMonth == '5') {
      return 'May';
    } else if (formattedMonth == '6') {
      return 'June';
    } else if (formattedMonth == '7') {
      return 'July';
    } else if (formattedMonth == '8') {
      return 'August';
    } else if (formattedMonth == '9') {
      return 'September';
    } else if (formattedMonth == '10') {
      return 'October';
    } else if (formattedMonth == '11') {
      return 'November';
    } else {
      return 'December';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 25, top: 15),
          child: Text(
            getMonthName() + ' ' + formattedDate,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            'TODAY',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
        ),
        StreamBuilder(
            stream: getTodaySpecialbloc.subject.stream,
            builder: (context, AsyncSnapshot<TodaySpecialResponse> snapshot) {
              if (snapshot.hasData) {
                return _getTodaySpecial(snapshot.data);
              } else if (snapshot.hasError) {
                return _loading();
              } else {
                return _loading();
              }
            })
      ],
    );
  }

  Widget _loading() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _error(e) {
    return Container(
      child: Text(e),
    );
  }

  Widget _getTodaySpecial(TodaySpecialResponse todaySpecialResponse) {
    List<getTodaySpecialmodel> data = todaySpecialResponse.special;
    if (data.length == 0) {
      return Container(
        width: double.infinity,
        height: 300,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      );
    } else {
      return GestureDetector(
        onTap:()=> Navigator.push(context, MaterialPageRoute(builder:(_)=> DetailScreen(data[0].id))),
              child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(data[0].imagURL), fit: BoxFit.cover)),
            ),
            Container(
              width: double.infinity,
              height: 300,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [Colors.black26, Colors.black38],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
            ),
            Container(
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  data[0].title,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
