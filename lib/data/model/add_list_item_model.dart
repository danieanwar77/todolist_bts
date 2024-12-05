/// statusCode : 2000
/// message : "Proses save berhasil"
/// errorMessage : null
/// data : {"id":2,"name":"activity 2","itemCompletionStatus":false}

class AddListItemModel {
  AddListItemModel({
      num? statusCode, 
      String? message, 
      dynamic errorMessage, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _errorMessage = errorMessage;
    _data = data;
}

  AddListItemModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _errorMessage = json['errorMessage'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _statusCode;
  String? _message;
  dynamic _errorMessage;
  Data? _data;
AddListItemModel copyWith({  num? statusCode,
  String? message,
  dynamic errorMessage,
  Data? data,
}) => AddListItemModel(  statusCode: statusCode ?? _statusCode,
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

/// id : 2
/// name : "activity 2"
/// itemCompletionStatus : false

class Data {
  Data({
      num? id, 
      String? name, 
      bool? itemCompletionStatus,}){
    _id = id;
    _name = name;
    _itemCompletionStatus = itemCompletionStatus;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _itemCompletionStatus = json['itemCompletionStatus'];
  }
  num? _id;
  String? _name;
  bool? _itemCompletionStatus;
Data copyWith({  num? id,
  String? name,
  bool? itemCompletionStatus,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  itemCompletionStatus: itemCompletionStatus ?? _itemCompletionStatus,
);
  num? get id => _id;
  String? get name => _name;
  bool? get itemCompletionStatus => _itemCompletionStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['itemCompletionStatus'] = _itemCompletionStatus;
    return map;
  }

}