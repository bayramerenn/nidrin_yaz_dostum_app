import 'package:nidrin_yaz_dostum_app/models/meaning_list.dart';
import 'package:nidrin_yaz_dostum_app/models/null_check.dart';

class HeaderDictionry {
  final String madde;
  final String lisan;
  final String birlesikler;
  final List<MeaningList> meaningList;

  HeaderDictionry({this.madde, this.lisan, this.birlesikler, this.meaningList});

  factory HeaderDictionry.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["anlamlarListe"] as List;
    print(jsonArray);
    var meaningList = jsonArray.map((e) => MeaningList.fromJson(e)).toList();

    return HeaderDictionry(
      madde: nullCheck(json['madde']),
      lisan: nullCheck(json['lisan']),
      birlesikler: nullCheck(json['birlesikler']),
      meaningList: nullCheck(meaningList),
    );
  }
}
