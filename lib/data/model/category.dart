import 'package:JoDija_reposatory/utilis/models/base_data_model.dart';

class CategoryDataModel extends BaseEntityDataModel  {
  String name;
  String nameEn ;
  String? image;

  static String nameKey = "name";
  static  String nameEnKey = "name_en";
  static String imageKey = "image";

  CategoryDataModel({required this.name, required this.nameEn  ,  required this.image, super.id}) {
    toJson();
  }

  factory CategoryDataModel.fromJson(Map<String, dynamic> json, String id) {
    return CategoryDataModel(

      name: json["$nameKey"]??"",
      nameEn:  json["$nameEnKey"]??"",
      image: json['$imageKey'] ?? "",

      id: id,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data[nameKey] = this.name;
    data[imageKey] = this.image;
    data [nameEnKey] = this.nameEn;
    data["id"]= this.id;
    return data;
  }
}
