import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/image_strings.dart';

class GymmiHomeScreen extends StatelessWidget {
  const GymmiHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: Icon(Icons.menu),
          title: Image.asset(logo),
          actions: [Icon(Icons.notifications)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.88),
              // color: Color.fromARGB(100, 221, 221, 221),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search_outlined,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      textAlign: TextAlign.left,
                      decoration: new InputDecoration.collapsed(
                        hintText: "Search Gym Near Me".toUpperCase(),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  width: 2,
                  color: Colors.black26,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.filter_list_sharp,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
