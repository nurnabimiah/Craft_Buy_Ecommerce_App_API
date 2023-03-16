class Urls {
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';
  static const String productSliderUrl = '$baseUrl/ListProductSlider';
  static const String productCategoryListUrl = '$baseUrl/CategoryList';
  static String productByRemarksUrl(String remarks) =>
      '$baseUrl/ListProductByRemark/$remarks';
}
