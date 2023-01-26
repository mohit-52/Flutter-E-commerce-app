import 'package:flutter/material.dart';
import 'package:food_delivery/common_widgets/big_text.dart';
import 'package:food_delivery/common_widgets/small_text.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Top Bar
        body: Column(
          children: [
            // Food Page Header
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Country and State
                  Column(
                    children: [
                      BigText(text: 'India', color: AppColors.mainColor, size: 30,),
                      Row(
                        children: [
                          SmallText(text: 'Delhi Ncr', color: Colors.black54, size: 14,),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ],
                  ),

                  // Search Icon
                  Container(
                    height: 45,
                    width: 45,
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.mainColor,
                    ),
                  )
                ],
              ),

            ),
            // Food Page Body
            FoodPageBody(),
          ],
        ),

      ),
    );
  }
}
