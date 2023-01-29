import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common_widgets/small_text.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Restraunt Name
        BigText(
          size: Dimensions.font26,
          text: text,
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
    );
  }
}