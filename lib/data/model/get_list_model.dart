/// statusCode : 2100
/// message : "Proses view all berhasil"
/// errorMessage : null
/// data : [{"id":1,"name":"todo hari ini","items":[{"id":1,"name":"activity 1","itemCompletionStatus":false},{"id":2,"name":"activity 2","itemCompletionStatus":false}],"checklistCompletionStatus":false}]

class GetListModel {
  GetListModel({
      num? statusCode, 
      String? message, 
      dynamic errorMessage, 
      List<DataList>? data,}){
    _statusCode = statusCode;
    _message = message;
    _errorMessage = errorMessage;
    _data = data;
}

  GetListModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DataList.fromJson(v));
      });
    }
  }
  num? _statusCode;
  String? _message;
  dynamic _errorMessage;
  List<DataList>? _data;
GetListModel copyWith({  num? statusCode,
  String? message,
  dynamic errorMessage,
  List<DataList>? data,
}) => GetListModel(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  errorMessage: errorMessage ?? _errorMessage,
  data: data ?? _data,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  dynamic get errorMessage => _errorMessage;
  List<DataList>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    map['errorMessage'] = _errorMessage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "todo hari ini"
/// items : [{"id":1,"name":"activity 1","itemCompletionStatus":false},{"id":2,"name":"activity 2","itemCompletionStatus":false}]
/// checklistCompletionStatus : false

class DataList {
  DataList({
      num? id, 
      String? name, 
      List<Items>? items, 
      bool? checklistCompletionStatus,}){
    _id = id;
    _name = name;
    _items = items;
    _checklistCompletionStatus = checklistCompletionStatus;
}

  DataList.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _checklistCompletionStatus = json['checklistCompletionStatus'];
  }
  num? _id;
  String? _name;
  List<Items>? _items;
  bool? _checklistCompletionStatus;
DataList copyWith({  num? id,
  String? name,
  List<Items>? items,
  bool? checklistCompletionStatus,
}) => DataList(  id: id ?? _id,
  name: name ?? _name,
  items: items ?? _items,
  checklistCompletionStatus: checklistCompletionStatus ?? _checklistCompletionStatus,
);
  num? get id => _id;
  String? get name => _name;
  List<Items>? get items => _items;
  bool? get checklistCompletionStatus => _checklistCompletionStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['checklistCompletionStatus'] = _checklistCompletionStatus;
    return map;
  }

}

/// id : 1
/// name : "activity 1"
/// itemCompletionStatus : false

class Items {
  Items({
      num? id, 
      String? name, 
      bool? itemCompletionStatus,}){
    _id = id;
    _name = name;
    _itemCompletionStatus = itemCompletionStatus;
}

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _itemCompletionStatus = json['itemCompletionStatus'];
  }
  num? _id;
  String? _name;
  bool? _itemCompletionStatus;
Items copyWith({  num? id,
  String? name,
  bool? itemCompletionStatus,
}) => Items(  id: id ?? _id,
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