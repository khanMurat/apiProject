class SeriesModel {
  String? name;
  String? startDate;
  String? country;
  String? network;
  String? status;
  String? imageURL;

  SeriesModel({
    required this.name,
    required this.imageURL,
    required this.startDate,
    required this.status,
    required this.country,
    required this.network,
  });

  factory SeriesModel.fromMap(Map<String, dynamic> map) {
    return SeriesModel(
        name: map['name'] as String,
        imageURL: map['image_thumbnail_path'] as String,
        startDate: map['start_date'] as String,
        status: map['status'] as String,
        country: map['country'] as String,
        network: map['network'] as String);
  }
}
