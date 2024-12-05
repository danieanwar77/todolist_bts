/// statusCode : 2000
/// message : "Proses save berhasil"
/// errorMessage : null
/// data : {"id":1,"name":"todo hari ini","items":null,"checklistCompletionStatus":false}

class AddListModel {
  AddListModel({
      num? statusCode, 
      String? message, 
      dynamic errorMessage, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _errorMessage = errorMessage;
    _data = data;
}

  AddListModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _errorMessage = json['errorMessage'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _statusCode;
  String? _message;
  dynamic _errorMessage;
  Data? _data;
AddListModel copyWith({  num? statusCode,
  String? message,
  dynamic errorMessage,
  Data? data,
}) => AddListModel(  statusCode: statusCode ?? _statusCode,
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

/// id : 1
/// name : "todo hari ini"
/// items : null
/// checklistCompletionStatus : false

class Data {
  Data({
      num? id, 
      String? name, 
      dynamic items, 
      bool? checklistCompletionStatus,}){
    _id = id;
    _name = name;
    _items = items;
    _checklistCompletionStatus = checklistCompletionStatus;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _items = json['items'];
    _checklistCompletionStatus = json['checklistCompletionStatus'];
  }
  num? _id;
  String? _name;
  dynamic _items;
  bool? _checklistCompletionStatus;
Data copyWith({  num? id,
  String? name,
  dynamic items,
  bool? checklistCompletionStatus,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  items: items ?? _items,
  checklistCompletionStatus: checklistCompletionStatus ?? _checklistCompletionStatus,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get items => _items;
  bool? get checklistCompletionStatus => _checklistCompletionStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['items'] = _items;
    map['checklistCompletionStatus'] = _checklistCompletionStatus;
    return map;
  }

}