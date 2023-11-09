class ApiException implements Exception {
  String? message;
  dynamic error;

  ApiException({this.message, this.error});
}
