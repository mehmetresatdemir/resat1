import 'package:flutter/material.dart';
import 'package:resat/src/widgets/food_cart.dart';
import '../pages/home_page.dart';
import '../pages/food_cart.dart';
import '../pages/favorites_page.dart';
import '../pages/Profile_page.dart';
import 'package:resat/cart/cart_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  HomePage homePage;
  cart_page cart1;
  FavoritesPage favoritespage;
  ProfilePage profilepage;
  List<Widget> pages;
  Widget currentPage;
  int CurrentTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePage = HomePage();
    cart1 = cart_page();
    favoritespage = FavoritesPage();
    profilepage = ProfilePage();

    pages = [homePage, cart1, favoritespage, profilepage];
    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: (int index){
          setState(() {
            CurrentTabIndex = index;
            currentPage = pages[index];
          });
        } ,
          currentIndex: CurrentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Orders"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text("Favorites")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile"))
          ]),
      body: currentPage,
      appBar: CurrentTabIndex ==1 ?AppBar(
        title:Text("Your Cart", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ): null,
    );
  }
}
