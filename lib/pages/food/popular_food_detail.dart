import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common_widgets/app_column_home_screen.dart';
import 'package:food_delivery/common_widgets/expandable_text_widget.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/utils/image_strings.dart';
import '../../common_widgets/app_icon.dart';
import '../../common_widgets/big_text.dart';
import '../../utils/colors.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Food Image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: Dimensions.populatFoodImgSize,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(foodImage1), fit: BoxFit.cover)),
              )),
          // Icons on the image i.e back and cart icon
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                )
              ],
            ),
          ),
          // Content below the image
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.populatFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: "World Street",
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: 'Introduce',
                      size: Dimensions.font20,
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                "Food is any substance consumed to provide nutritional support and energy to an organism.[2][3] It can be raw, processed or formulated and is consumed orally by animals for growth, health or pleasure. Food is mainly composed of water, lipids, proteins and carbohydrates. Minerals (e.g. salts) and organic substances (e.g. vitamins) can also be found in food.[4] Plants, algae and some microorganisms use photosynthesis to make their own food molecules.[5] Water is found in many foods and has been defined as a food by itself.[6] Water and fiber have low energy densities, or calories, while fat is the most energy dense component.[3] Some inorganic (non-food) elements are also essential for plant and animal "
                                    "functioning.", ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
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
                    Icons.remove,
                    color: AppColors.iconColor2,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: '0'),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.iconColor2,
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
                    color: AppColors.iconColor2,
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
    );
  }
}
