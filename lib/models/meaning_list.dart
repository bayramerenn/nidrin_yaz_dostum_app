import 'package:nidrin_yaz_dostum_app/models/property_list.dart';
import 'package:nidrin_yaz_dostum_app/models/sample_list.dart';
import 'package:nidrin_yaz_dostum_app/models/writer.dart';

import 'null_check.dart';

class MeaningList {
  final String anlam;
  final SampleList sampleList;
  final PropertyList propertyList;
  MeaningList({this.anlam, this.sampleList, this.propertyList});

  factory MeaningList.fromJson(Map<String, dynamic> json) {
    return MeaningList(
      anlam: nullCheck(json['anlam']),
      sampleList: json["orneklerListe"] == null
          ? SampleList(ornek: "", yazar: Writer(tam_adi: ""))
          : SampleList.fromJson(
              json["orneklerListe"][0] as Map<String, dynamic>),
      propertyList: json["ozelliklerListe"] == null
          ? PropertyList(tam_adi: "")
          : PropertyList.fromJson(
              json["ozelliklerListe"][0] as Map<String, dynamic>),
    );
  }
}
