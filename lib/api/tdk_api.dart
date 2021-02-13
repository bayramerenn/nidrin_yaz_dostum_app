import 'package:http/http.dart' as http;

class TdkApi {
  static Future<http.Response> getWord(String word) =>
      http.get("https://sozluk.gov.tr/gts?ara=$word");
}
