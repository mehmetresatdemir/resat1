import 'package:flutter/material.dart';

class OrderCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 75.0,
              width: 45.0,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Color(0XFFD3D3D3)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.keyboard_arrow_up),
                  ),
                  Text(
                    "0",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.keyboard_arrow_down),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("android/assets/images/lunch.jpeg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 5.0),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Grilled Chicken",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  "3.0",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 16.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: 45.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text("chicken"),
                            Text(
                              "x",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text("chicken"),
                            Text(
                              "x",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text("chicken"),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  "x",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
