import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewMasterContainer = screenHeight / 2.50;
  static double pageViewContainer = screenHeight / 3.34;
  static double pageViewTextContainer = screenHeight / 6.17;

// Dynamic height for padding and margin
  static double height10 = screenHeight / 80.2;
  static double height15 = screenHeight / 53.52;
  static double height20 = screenHeight / 40.1;
  static double height30 = screenHeight / 26.76;
  static double height45 = screenHeight / 17.84;

  // Dynamic width for padding and margin
  static double width10 = screenHeight / 80.2;
  static double width15 = screenHeight / 53.52;
  static double width20 = screenHeight / 40.1;
  static double width30 = screenHeight / 26.76;
  static double width45 = screenHeight / 17.84;

// Dynamic Font Sizes
  static double font20 = screenHeight / 44;

  // Dynamic icon sizes
  static double icon24 = screenHeight / 33.45;

  // Dynamic radius for padding and margin
  static double radius5 = screenHeight / 160.58;
  static double radius10 = screenHeight / 80.2;
  static double radius15 = screenHeight / 53.52;
  static double radius20 = screenHeight / 40.1;
  static double radius30 = screenHeight / 26.76;
}
