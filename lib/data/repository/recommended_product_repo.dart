import 'package:get/get.dart';

import '../api/apiClient.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;

  RecommendedProductRepo({
    required this.apiClient,
});

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData("end url");
  }

}