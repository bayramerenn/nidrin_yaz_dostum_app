import 'dart:convert';

import 'package:nidrin_yaz_dostum_app/api/tdk_api.dart';
import 'package:nidrin_yaz_dostum_app/models/header_dictionary.dart';

abstract class DictonaryRepository {
  Future<List<HeaderDictionry>> getWord(String word);
}

class DictonaryDaoRepository implements DictonaryRepository {
  @override
  Future<List<HeaderDictionry>> getWord(String word) async {
    var api = await TdkApi.getWord(word);
    print(api.body);
    Iterable list = json.decode(api.body);

    var headerJson =
        list.map((json) => HeaderDictionry.fromJson(json)).toList();
    return headerJson;
  }
}
