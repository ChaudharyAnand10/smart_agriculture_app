class CropModel {
  final String name;
  final String nameHindi;
  final List<String> season;
  final List<String> soilType;
  final String waterRequirement;
  final String temperatureRange;
  final int growthDurationDays;

  final String fertilizer;
  final List<String> region;
  final int pricePerQuintal;
  final String description;
  final String imageUrl;

  final List<String> searchKeywords;

  CropModel({
    required this.name,
    required this.nameHindi,
    required this.season,
    required this.soilType,
    required this.waterRequirement,
    required this.temperatureRange,
    required this.growthDurationDays,
    required this.fertilizer,
    required this.region,
    required this.pricePerQuintal,
    required this.description,
    required this.imageUrl,
    required this.searchKeywords,
  });

  // 🔥 SAFE fromMap (no crash)
  factory CropModel.fromMap(Map<String, dynamic> data) {
    return CropModel(
      name: data['name'] ?? '',
      nameHindi: data['nameHindi'] ?? '',

      season: data['season'] is List
          ? List<String>.from(data['season'])
          : [data['season'] ?? ''],

      soilType: data['soilType'] is List
          ? List<String>.from(data['soilType'])
          : [data['soilType'] ?? ''],

      waterRequirement: data['waterRequirement'] ?? '',
      temperatureRange: data['temperatureRange'] ?? '',
      growthDurationDays: data['growthDurationDays'] ?? 0,

      fertilizer: data['fertilizer'] ?? '',
      region: data['region'] is List
          ? List<String>.from(data['region'])
          : [data['region'] ?? ''],

      pricePerQuintal: data['pricePerQuintal'] ?? 0,
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',

      searchKeywords: data['searchKeywords'] is List
          ? List<String>.from(data['searchKeywords'])
          : [data['searchKeywords'] ?? ''],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "nameHindi": nameHindi,
      "season": season,
      "soilType": soilType,
      "waterRequirement": waterRequirement,
      "temperatureRange": temperatureRange,
      "growthDurationDays": growthDurationDays,
      "fertilizer": fertilizer,
      "region": region,
      "pricePerQuintal": pricePerQuintal,
      "description": description,
      "imageUrl": imageUrl,
      "searchKeywords": searchKeywords,
    };
  }
}