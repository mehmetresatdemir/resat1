import 'package:flutter/material.dart';
import 'package:resat/Listview//model/Planet.dart';
import 'package:resat/Listview//model/Planets.dart';
import 'package:resat/Listview//ui/planet_detail/DetailAppBar.dart';
import 'package:resat/Listview//ui/planet_detail/PlanetDetailBody.dart';

class PlanetDetailPage extends StatelessWidget {

  final Planet planet;

  PlanetDetailPage(String id) :
    planet = PlanetDao.getPlanetById(id);



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new PlanetDetailBody(planet),
          new DetailAppBar(),
        ],
      ),
    );
  }
}
