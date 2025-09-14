import 'package:JoDija_reposatory/utilis/models/base_data_model.dart';

class ImagesDataModel extends BaseEntityDataModel  {
  String image;

  /// constructor and json
  ///
  ImagesDataModel({
    super.id,
    required this.image,
  }) {
    toJson();
  }
  factory ImagesDataModel.fromJson(Map<String, dynamic> json, String id) {
    return ImagesDataModel(
      id: id,
      image: json['image'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['image'] = this.image;

    return data;
  }
}
