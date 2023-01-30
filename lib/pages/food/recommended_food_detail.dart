import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common_widgets/app_icon.dart';
import 'package:food_delivery/common_widgets/big_text.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/utils/image_strings.dart';

import '../../common_widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 75,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20),
                      )),
                  padding: EdgeInsets.only(
                      top: Dimensions.height10, bottom: Dimensions.height10),
                  child: Center(
                      child: BigText(
                          size: Dimensions.font26, text: "Chinesse Corner"))),
            ),
            pinned: true,
            backgroundColor: Colors.yellowAccent,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                foodImage1,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(
                      text:
                          "Food is any substance consumed to provide nutritional support and energy to an organism.[2][3] It can be raw, processed or formulated and is consumed orally by animals for growth, health or pleasure. Food is mainly composed of water, lipids, proteins and carbohydrates. Minerals (e.g. salts) and organic substances (e.g. vitamins) can also be found in food.[4] Plants, algae and some microorganisms use photosynthesis to make their own food molecules.[5] Water is found in many foods and has been defined as a food by itself.[6] Water and fiber have low energy densities, or calories, while fat is the most energy dense component.[3] Some inorganic (non-food) elements are also essential for "
                          "plant and animalfunctioning.Food is any substance consumed to provide nutritional support and energy to an organism.[2][3] It can be raw, processed or formulated and is consumed orally by animals for growth, health or pleasure. Food is mainly composed of water, lipids, proteins and carbohydrates. Minerals (e.g. salts) and organic substances (e.g. vitamins) can also be found in food.[4] Plants, algae and some microorganisms use photosynthesis to make their own food molecules.[5] Water is found in many foods and has been defined as a food by itself.[6] Water and fiber have low energy densities, or calories, while fat is the most energy dense component.[3] Some inorganic (non-food) elements are also essential for plant and animal "
                          "functioning.Food is any substance consumed to provide nutritional support and energy to an organism.[2][3] It can be raw, processed or formulated and is consumed orally by animals for growth, health or pleasure. Food is mainly composed of water, lipids, proteins and carbohydrates. Minerals (e.g. salts) and organic substances (e.g. vitamins) can also be found in food.[4] Plants, algae and some microorganisms use photosynthesis to make their own food molecules.[5] Water is found in many foods and has been defined as a food by itself.[6] Water and fiber have low energy densities, or calories, while fat is the most energy dense component.[3] Some inorganic (non-food) elements are also essential for plant and animal "
                          "functioning Food is any substance consumed to provide nutritional support and energy to an organism.[2][3] It can be raw, processed or formulated and is consumed orally by animals for growth, health or pleasure. Food is mainly composed of water, lipids, proteins and carbohydrates. Minerals (e.g. salts) and organic substances (e.g. vitamins) can also be found in food.[4] Plants, algae and some microorganisms use photosynthesis to make their own food molecules.[5] Water is found in many foods and has been defined as a food by itself.[6] Water and fiber have low energy densities, or calories, while fat is the most energy dense component.[3] Some inorganic (non-food) elements are also essential for plant and animal "
                          "functioning."),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppIcon(icon: Icons.remove, backgroundColor: AppColors.mainColor, iconColor: Colors.white,),
                BigText(text: "12.88\$" + "X" + "0"),
                AppIcon(icon: Icons.add, backgroundColor: AppColors.mainColor,iconColor: Colors.white,),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                ),
                color: AppColors.buttonBackgroundColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: '1.12 |'),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: "Add to cart")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
