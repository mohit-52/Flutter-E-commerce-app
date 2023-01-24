import 'package:flutter/material.dart';
import 'package:food_delivery/common_widgets/big_text.dart';
import 'package:food_delivery/common_widgets/small_text.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/image_strings.dart';

class FoodPageBody extends StatelessWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.85);
    return Container(
      height: 320,
      color: Colors.transparent,
      child: PageView.builder(
        controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }
}

Widget _buildPageItem(int index) {
  return Stack(
    children: [
      Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        height: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(foodImage1))),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
          padding: EdgeInsets.only(left: 10,top: 15),
          height: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Punjabi Ziaka', color: Colors.black87,),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.mainColor,size: 15,),
                      Icon(Icons.star, color: AppColors.mainColor,size: 15,),
                      Icon(Icons.star, color: AppColors.mainColor,size: 15,),
                      Icon(Icons.star, color: AppColors.mainColor,size: 15,),
                      SizedBox(width: 20,),
                      SmallText(text: '4.5'),
                      SizedBox(width: 20,),
                      SmallText(text: '4287 Ratings'),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.cookie,size: 25, color: Colors.yellow,),
                      SmallText(text: 'Normal'),
                      SizedBox(width: 20,),
                      Icon(Icons.pin_drop,size: 25, color: AppColors.mainColor,),
                      SmallText(text: '1.6Km'),
                      SizedBox(width: 20,),
                      Icon(Icons.timelapse_sharp,size: 25, color: Colors.red,),
                      SmallText(text: '32 Min'),
                      SizedBox(width: 20,),

                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ],
  );
}
