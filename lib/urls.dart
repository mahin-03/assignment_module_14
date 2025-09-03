class Urls {
  static const String _baseUrl = 'http://35.73.30.144:2008/api/v1';
  static const String getProductUrls = '$_baseUrl/ReadProduct';

  static String deleteProductUrls(String id) => '$_baseUrl/DeleteProduct/$id';
  static String updateProductUrls(String id) => '$_baseUrl/UpdateProduct/$id';
}
