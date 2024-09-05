import 'dart:convert';
/// title : "One Day Package"
/// price : "2799"
/// desc : "Lorem Ipsum is simply dummy text of the printing and typesetting industry."

PackagesList packagesListFromJson(String str) => PackagesList.fromJson(json.decode(str));
String packagesListToJson(PackagesList data) => json.encode(data.toJson());
class PackagesList {
  PackagesList({
      String? title, 
      String? price, 
      String? desc,}){
    _title = title;
    _price = price;
    _desc = desc;
}

  PackagesList.fromJson(dynamic json) {
    _title = json['title'];
    _price = json['price'];
    _desc = json['desc'];
  }
  String? _title;
  String? _price;
  String? _desc;
PackagesList copyWith({  String? title,
  String? price,
  String? desc,
}) => PackagesList(  title: title ?? _title,
  price: price ?? _price,
  desc: desc ?? _desc,
);
  String? get title => _title;
  String? get price => _price;
  String? get desc => _desc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['price'] = _price;
    map['desc'] = _desc;
    return map;
  }

}