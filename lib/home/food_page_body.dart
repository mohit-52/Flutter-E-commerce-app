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

  // Variables
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _Masterheight = Dimensions.pageViewMasterContainer;
  double _height = Dimensions.pageViewContainer;
  double _textHeight = Dimensions.pageViewTextContainer;

  // Functions
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
        // Page View Builder for Image Card and Info Card Slider Section
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
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        //  Popular Text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: '.', color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food pairing', color: Colors.black26,),
              ),
            ],
          ),
        ),
        // List of other restraunts
        SizedBox(height: Dimensions.height30,),
        ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.width20),
              child: Row(
                children: [
                  // Image Container
                  Container(
                    height: Dimensions.listViewImageheight120,
                    width:Dimensions.listViewImageWidth100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius30),
                        color: Colors.white38,
                        image: DecorationImage(
                            image: AssetImage(foodImage1), fit: BoxFit.cover
                        )
                    ),
                  ),
                  // Text
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewImageheight100,
                      padding: EdgeInsets.all(Dimensions.radius10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                        ),
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: 'Nutritious fruit meal that i love '),
                            SizedBox(height: Dimensions.height10,),
                            SmallText(text: 'With chinese charastersitics'),
                            SizedBox(height: Dimensions.height10,),

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
                      ),
                    ),
                  )
                ],
              ),

            );
          }),

      ],
    );
  }

// Function for Image Card and Info Card and Transform Animation
  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();

    // Current card transform
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    // Next card transform
    else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    // Previous card transform
    else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    // Card transform
    else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          // Image Card with food image
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.height10, right: Dimensions.height10),
            height: _height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(foodImage1))),
          ),

          // Text Card
          Align(
            alignment: Alignment.bottomCenter,
            // Text Card Container
            child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                    bottom: Dimensions.height30),
                padding: EdgeInsets.only(
                    left: Dimensions.width10, top: Dimensions.height15),
                height: _textHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                    ],
                    color: Colors.white),

                // Text card Details container
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      left: Dimensions.width15,
                      right: Dimensions.width15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Restraunt Name
                      BigText(
                        text: 'World Street',
                        color: Colors.black87,
                      ),

                      SizedBox(
                        height: Dimensions.height10,
                      ),

                      // Text Card Middle options
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(
                                5,
                                    (index) =>
                                    Icon(
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
                          height: Dimensions.height20
                      ),

                      // Text Card bottom options
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
