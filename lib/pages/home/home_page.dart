import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedIndex = 0;

  List pages = [
    MainFoodPage(),
    Container(child: Center(child: Text("Archive Page"),),),
    CartPage(),
    // Container(child: Center(child: Text("Cart Page"),),),
    Container(child: Center(child: Text("Profile Page"),),),
  ];

  void onTapNav(int index){
    setState((){
      _selectedIndex= index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.amberAccent,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "Archive"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Shopping Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
