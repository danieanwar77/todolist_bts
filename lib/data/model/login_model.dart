/// statusCode : 2110
/// message : "Proses view detail berhasil"
/// errorMessage : null
/// data : {"token":"eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6W119.i2OVQdxr08dmIqwP7cWOJk5Ye4fySFUqofl-w6FKbm4EwXTStfm0u-sGhDvDVUqNG8Cc7STtUJlawVAP057Jlg"}

class LoginModel {
  LoginModel({
      num? statusCode, 
      String? message, 
      dynamic errorMessage, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _errorMessage = errorMessage;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _errorMessage = json['errorMessage'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _statusCode;
  String? _message;
  dynamic _errorMessage;
  Data? _data;
LoginModel copyWith({  num? statusCode,
  String? message,
  dynamic errorMessage,
  Data? data,
}) => LoginModel(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  errorMessage: errorMessage ?? _errorMessage,
  data: data ?? _data,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  dynamic get errorMessage => _errorMessage;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    map['errorMessage'] = _errorMessage;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// token : "eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6W119.i2OVQdxr08dmIqwP7cWOJk5Ye4fySFUqofl-w6FKbm4EwXTStfm0u-sGhDvDVUqNG8Cc7STtUJlawVAP057Jlg"

class Data {
  Data({
      String? token,}){
    _token = token;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
Data copyWith({  String? token,
}) => Data(  token: token ?? _token,
);
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}