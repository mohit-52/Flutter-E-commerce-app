import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
   Color? color;
   double size;
  TextOverflow overFlow;
   BigText({Key? key,
     required this.text,
   this.color = const Color(0xff000000),
     this.size = 0,
     this.overFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size ==0 ? Dimensions.font20 : size,
        fontWeight: FontWeight.w400,
      ),

      overflow: overFlow,

    );
  }
}
