import 'package:flutter/material.dart';
import 'package:food_delivery/common_widgets/small_text.dart';

import '../utils/dimensions.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  const IconTextWidget({Key? key,
  required this.text,
  required this.icon,
    this.iconColor = const Color(0xFF82dad0)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: Dimensions.icon25,
          color: iconColor,
        ),
        SmallText(text: text),
      ],
    ) ;
  }
}
