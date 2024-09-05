import 'dart:convert';
/// code : "200"
/// status : "success"
/// message : "Packages list"
/// response : {}

GenricResponse genricResponseFromJson(String str) => GenricResponse.fromJson(json.decode(str));
String genricResponseToJson(GenricResponse data) => json.encode(data.toJson());
class GenricResponse {
  GenricResponse({
      String? code, 
      String? status, 
      String? message, 
      dynamic response,}){
    _code = code;
    _status = status;
    _message = message;
    _response = response;
}

  GenricResponse.fromJson(dynamic json) {
    _code = json['code'];
    _status = json['status'];
    _message = json['message'];
    _response = json['response'];
  }
  String? _code;
  String? _status;
  String? _message;
  dynamic _response;
GenricResponse copyWith({  String? code,
  String? status,
  String? message,
  dynamic response,
}) => GenricResponse(  code: code ?? _code,
  status: status ?? _status,
  message: message ?? _message,
  response: response ?? _response,
);
  String? get code => _code;
  String? get status => _status;
  String? get message => _message;
  dynamic get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['status'] = _status;
    map['message'] = _message;
    map['response'] = _response;
    return map;
  }

}