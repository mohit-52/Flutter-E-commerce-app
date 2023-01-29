import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;
  SmallText({Key? key,
    required this.text,
    this.color = const Color (0xFFccc7c5),
    this.size = 12,
    this.height = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        height: height,
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
