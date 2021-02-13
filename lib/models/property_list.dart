import 'null_check.dart';

class PropertyList {
  final String tam_adi;

  PropertyList({this.tam_adi});

  factory PropertyList.fromJson(Map<String, dynamic> json) {
    return PropertyList(
      tam_adi: nullCheck(json['tam_adi']),
    );
  }
}
