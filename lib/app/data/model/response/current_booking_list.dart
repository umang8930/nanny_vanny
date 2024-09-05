import 'dart:convert';
/// title : "One Day Package"
/// from_date : "06.08.2024"
/// from_time : "12 PM"
/// to_date : "08.08.2024"
/// to_time : "2 PM"

CurrentBookingList currentBookingListFromJson(String str) => CurrentBookingList.fromJson(json.decode(str));
String currentBookingListToJson(CurrentBookingList data) => json.encode(data.toJson());
class CurrentBookingList {
  CurrentBookingList({
      String? title, 
      String? fromDate, 
      String? fromTime, 
      String? toDate, 
      String? toTime,}){
    _title = title;
    _fromDate = fromDate;
    _fromTime = fromTime;
    _toDate = toDate;
    _toTime = toTime;
}

  CurrentBookingList.fromJson(dynamic json) {
    _title = json['title'];
    _fromDate = json['from_date'];
    _fromTime = json['from_time'];
    _toDate = json['to_date'];
    _toTime = json['to_time'];
  }
  String? _title;
  String? _fromDate;
  String? _fromTime;
  String? _toDate;
  String? _toTime;
CurrentBookingList copyWith({  String? title,
  String? fromDate,
  String? fromTime,
  String? toDate,
  String? toTime,
}) => CurrentBookingList(  title: title ?? _title,
  fromDate: fromDate ?? _fromDate,
  fromTime: fromTime ?? _fromTime,
  toDate: toDate ?? _toDate,
  toTime: toTime ?? _toTime,
);
  String? get title => _title;
  String? get fromDate => _fromDate;
  String? get fromTime => _fromTime;
  String? get toDate => _toDate;
  String? get toTime => _toTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['from_date'] = _fromDate;
    map['from_time'] = _fromTime;
    map['to_date'] = _toDate;
    map['to_time'] = _toTime;
    return map;
  }

}