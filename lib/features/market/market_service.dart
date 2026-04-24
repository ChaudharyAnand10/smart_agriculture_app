import 'dart:convert';
import 'package:http/http.dart' as http;
import 'market_model.dart';

class MarketService {
  final String apiKey = "579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b";

  Future<List<MarketModel>> fetchMarket({
    required int offset,
    String search = "",
  }) async {
    String url =
        "https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070"
        "?api-key=$apiKey&format=json&limit=20&offset=$offset";

    // 🔍 search filter (district/state/commodity)
    if (search.isNotEmpty) {
      url += "&filters[district]=$search";
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List records = data['records'];

      return records.map((e) => MarketModel.fromJson(e)).toList();
    } else {
      throw Exception("API failed");
    }
  }
}