import 'package:flutter/material.dart';

class BoughtFoods extends StatefulWidget{


  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double ratings;

  BoughtFoods({this.id, this.name,this.imagePath,this.category,this.discount,this.price,this.ratings});



  @override
  _BoughtFoodsstate createState() => _BoughtFoodsstate();
}

class _BoughtFoodsstate extends State<BoughtFoods>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),


      child: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            width: 340.0,
            child: Image.asset(widget.imagePath, fit: BoxFit.cover,),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Container(
           height: 60.0,
            width: 340.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,Colors.black12
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),

            )
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Row(

              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text (
                      widget.name, style:
                    TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    Row(
                      children: <Widget>[
                        Icon(Icons.star, color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star, color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star, color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star, color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star, color: Theme.of(context).primaryColor,size: 16.0,),
                        SizedBox(width: 20.0),
                        Text((widget.ratings.toString()+"Reviews"), style: TextStyle(color: Colors.grey),),



                      ],

                    ),
                  ],
                )
              ],

            ),
          )
        ],
      ),
    );
  }
}


