
class ApiException implements Exception{
  String message;
  int code;
  ApiException(this.code,this.message);
}