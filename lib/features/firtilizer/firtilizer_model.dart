class FertilizerModel {
  final String name;
  final String composition;
  final List<String> suitableCrops;
  final String description;

  FertilizerModel({
    required this.name,
    required this.composition,
    required this.suitableCrops,
    required this.description,
  });

  factory FertilizerModel.fromMap(Map<String, dynamic> data) {
    return FertilizerModel(
      name: data['name'],
      composition: data['composition'],
      suitableCrops: List<String>.from(data['suitableCrops']),
      description: data['description'],
    );
  }
}