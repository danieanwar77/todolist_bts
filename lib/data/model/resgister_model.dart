/// statusCode : 2000
/// message : "Proses save berhasil"
/// errorMessage : null
/// data : null

class RegisterModel {
  RegisterModel({
      num? statusCode, 
      String? message, 
      dynamic errorMessage, 
      dynamic data,}){
    _statusCode = statusCode;
    _message = message;
    _errorMessage = errorMessage;
    _data = data;
}

  RegisterModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _errorMessage = json['errorMessage'];
    _data = json['data'];
  }
  num? _statusCode;
  String? _message;
  dynamic _errorMessage;
  dynamic _data;
RegisterModel copyWith({  num? statusCode,
  String? message,
  dynamic errorMessage,
  dynamic data,
}) => RegisterModel(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  errorMessage: errorMessage ?? _errorMessage,
  data: data ?? _data,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  dynamic get errorMessage => _errorMessage;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    map['errorMessage'] = _errorMessage;
    map['data'] = _data;
    return map;
  }

}