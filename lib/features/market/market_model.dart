class MarketModel {
  final String state;
  final String district;
  final String market;
  final String commodity;
  final String price;

  MarketModel({
    required this.state,
    required this.district,
    required this.market,
    required this.commodity,
    required this.price,
  });

  factory MarketModel.fromJson(Map<String, dynamic> json) {
    return MarketModel(
      state: json['state'] ?? "",
      district: json['district'] ?? "",
      market: json['market'] ?? "",
      commodity: json['commodity'] ?? "",
      price: json['modal_price'].toString(),
    );
  }
}