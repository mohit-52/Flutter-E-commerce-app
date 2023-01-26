import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common_widgets/big_text.dart';
import 'package:food_delivery/common_widgets/small_text.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/utils/image_strings.dart';

import '../common_widgets/icon_and_text_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _Masterheight = Dimensions.pageViewMasterContainer;
  double _height = Dimensions.pageViewContainer;
  double _textHeight = Dimensions.pageViewTextContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('Screen Size is ${MediaQuery.of(context).size.height}');
    return Column(
      children: [
        // Page View Builder for Image Card and Info Card and Transform Animation
        Container(
          height: _Masterheight,
          color: Colors.transparent,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),

    // Dots Indicator for the above cards
    new DotsIndicator(
    dotsCount: 5,
    position: _currentPageValue,
    decorator: DotsDecorator(
      activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    )
      ],
    );
  }
// Function for Image Card and Info Card and Transform Animation
  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: Dimensions.height10, right: Dimensions.height10),
            height: _height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(foodImage1))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(left: Dimensions.height30, right: Dimensions.height30, bottom: Dimensions.height30),
                padding: EdgeInsets.only(left: Dimensions.height10, top: Dimensions.height15),
                height: _textHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0,5)
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5,0)
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(5,0)
                      ),
                    ],
                    color: Colors.white),
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.height15, right: Dimensions.height15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Punjabi Ziaka',
                        color: Colors.black87,
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          )),
                          SizedBox(
                            width: Dimensions.height20,
                          ),
                          SmallText(text: '4.5'),
                          SizedBox(
                            width: Dimensions.height20,
                          ),
                          SmallText(text: '4287 Ratings'),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconTextWidget(
                            icon: Icons.cookie,
                            iconColor: AppColors.iconColor2,
                            text: "Normal",
                          ),
                          IconTextWidget(
                            icon: Icons.pin_drop,
                            iconColor: AppColors.mainColor,
                            text: "1.6Km",
                          ),
                          IconTextWidget(
                            icon: Icons.timelapse_sharp,
                            iconColor: Colors.redAccent,
                            text: "32min",
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
