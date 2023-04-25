import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common_widgets/app_column_home_screen.dart';
import 'package:food_delivery/common_widgets/expandable_text_widget.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/utils/image_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../common_widgets/app_icon.dart';
import '../../common_widgets/big_text.dart';
import '../../utils/colors.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

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
                        image: NetworkImage(AppConstants.BASE_URL +
                            AppConstants.UPLOAD_URl +
                            product.img!),
                        fit: BoxFit.cover)),
              )),
          // Icons on the image i.e back and cart icon
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainFoodPage());
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
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
                      text: product.name!,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: 'Introduce',
                      size: Dimensions.font20,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                          text: product.description!,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
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
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove,
                        color: AppColors.iconColor2,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.iconColor2,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.all(Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.monetization_on_outlined,
                          color: AppColors.iconColor2,
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        BigText(text: product.price!.toString() + " |"),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        BigText(text: "Add to cart")
                      ],
                    ),

                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
