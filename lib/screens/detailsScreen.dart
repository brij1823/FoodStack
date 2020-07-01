import 'package:FoodStack/bloc/foodDetailbloc.dart';
import 'package:FoodStack/model/fooddetail.dart';
import 'package:FoodStack/model/fooddetailresponse.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  int id;
  DetailScreen(this.id);
  @override
  _DetailScreenState createState() => _DetailScreenState(this.id);
}

class _DetailScreenState extends State<DetailScreen> {
  int id;
  _DetailScreenState(this.id);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fooddetailsbloc.getFoodDetail(id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7a9bee),
      appBar: AppBar(
        backgroundColor:Color(0xff7a9bee),
        elevation: 0.0,
        centerTitle: true,
        title: Text('Details',style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 25,
          color: Colors.white, 
        ),
        
        ),

      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 70,left: 15,right: 15),
                padding: EdgeInsets.all(15),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
                ),
              ),
              StreamBuilder(
                stream: fooddetailsbloc.subject.stream,
                builder: (context,AsyncSnapshot<FoodDetailResponse> snapshot){
                  if(snapshot.hasData){
                    return _loadImage(snapshot.data);
                  }
                  else if(snapshot.hasError){
                    return _hasError(snapshot.error);
                  }
                  else{
                    return _loading();
                  }
                })

            ],
          )
        ],
      ),

    );
  }

  Widget _loading(){
    return Center(
          child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _hasError(String error){
    return Container(
      child: Text(error),
    );
  }

  Widget _loadImage(FoodDetailResponse foodDetailResponse){
    FoodDetail foodDetail = foodDetailResponse.foodDetail;
    print(foodDetail.weight);
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
          width: 175,
          height: 175,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 25
              )
            ],
            shape: BoxShape.circle,
            image: DecorationImage(image: NetworkImage(foodDetail.imageURL),fit: BoxFit.cover)

          ),
        ),
      ),

      Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Center(
                  child: Text(
            foodDetail.title,style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'
          ),),
        ),
        SizedBox(height: 20,),
        Row(children: <Widget>[
            Expanded(
                          child: Container(
          child: Text("\$"+foodDetail.price.toString(),style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 25
          ),),
        ),
            ),
            Container(
              height: 50,
              width: 1,
              color: Colors.black38,
            ),
            Expanded(
                          child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'No. of Servings',
                      style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15
          )
                    ),
                    SizedBox(height: 8,),
                     Text(
                      foodDetail.servings.toInt().toString(),
                      style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25
          )
                    ),

                  ],
                ),
              ),
            )

        ],),

        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 1,right: 8),
                height: 200,
                
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                                          child: Text('Weight',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20
                      ),),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 1,right: 8),
                height: 200,
                
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                                          child: Text('Calories',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20
                      ),),
                    )
                  ],
                ),
              ),
            ),

            Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 1,right: 8),
                height: 200,
                
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                                          child: Text('Vitamins',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20
                      ),),
                    )
                  ],
                ),
              ),
            ),

            
          ],
        )


          ],
        )
      )
      ],
    );
  }
}