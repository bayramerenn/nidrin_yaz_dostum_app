import 'package:nidrin_yaz_dostum_app/models/writer.dart';

import 'null_check.dart';

class SampleList {
  final String ornek;
  final Writer yazar;

  SampleList({this.ornek, this.yazar});
  factory SampleList.fromJson(Map<String, dynamic> json) {
    return SampleList(
      ornek: nullCheck(json['ornek']),
      yazar: json["yazar"] == null
          ? Writer(tam_adi: "")
          : Writer.fromJson(json["yazar"][0] as Map<String, dynamic>),
    );
  }
}
