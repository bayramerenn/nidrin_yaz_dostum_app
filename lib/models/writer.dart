import 'null_check.dart';

class Writer {
  final String tam_adi;

  Writer({this.tam_adi});

  factory Writer.fromJson(Map<String, dynamic> json) {
    return Writer(
      tam_adi: nullCheck(json['tam_adi']),
    );
  }
}
