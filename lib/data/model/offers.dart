import 'package:JoDija_DataSource/utilis/models/base_data_model.dart';

class OffersDataModel extends BaseDataModel {
  String image;
  String title;
  String baseLink;
  String pramLink;
  bool isStart = false;

  /// constructor and json
  ///
  OffersDataModel(
      {required super.id,
      this.isStart = false,
      required this.image,
      required this.title,
      required this.baseLink,
      required this.pramLink}) {
    toJson();
  }
  factory OffersDataModel.fromJson(Map<String, dynamic> json, String id) {
    return OffersDataModel(
      id: id,
      image: json['image'] ?? "",
      title: json['title'] ?? "",
      baseLink: json['baseLink'] ?? "",
      pramLink: json['pramLink'] ?? "",
      isStart: json['isStart'] ?? false,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['image'] = this.image;
    data['title'] = this.title;
    data['baseLink'] = this.baseLink;
    data['pramLink'] = this.pramLink;
    data['isStart'] = this.isStart;
    return data;
  }
}
