class Urls {
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';
  static const String productSliderUrl = '$baseUrl/ListProductSlider';
  static const String productCategoryListUrl = '$baseUrl/CategoryList';
  static const String readProfileDeatailsUrl = '$baseUrl/ReadProfile';
  static String productByRemarksUrl(String remarks) =>
      '$baseUrl/ListProductByRemark/$remarks';
  static String productByCategoryUrl(String categoryId) =>
      '$baseUrl/ListProductByCategory/$categoryId';

  ///product details  k id diye niye asbo

  static String productDetailsByIdUrl(int productId) =>
      '$baseUrl/ProductDetailsById/$productId';

  static String sendOtpToEmailUrl(String email) => '$baseUrl/UserLogin/$email';

  static String verifyOtpUrl(String email, String oTp) =>
      '$baseUrl/VerifyLogin/$email/$oTp';
}
