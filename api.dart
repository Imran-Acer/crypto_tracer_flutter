import 'dart:convert';
import 'package:http/http.dart' as http;
class API{
  static Future<List<dynamic>>fetchCoins() async {
    Uri path = Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&category=layer-1&per_page=20&page=1');
    var response=await http.get(path);
    var jsonDecoded=jsonDecode(response.body) as List<dynamic>;
    return jsonDecoded;
  }
}