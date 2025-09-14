import 'package:JoDija_reposatory/utilis/models/base_data_model.dart';

class ProductDataModel extends BaseEntityDataModel {
  String name;
  String? image;
  String ? cardData ;
  bool ? isPublished ;
  bool ? isFeatured ;
  String? language ;
  static  String isPublishedKey = "isPublished";
  static  String isFeaturedKey = "isFeatured";
  static  String languageKey = "language";
  static  String nameKey = "name";
  static   String imageKey = "image";
  static  String cardDataKey = "cardData";
  ProductDataModel({ required  this.name, required this.image ,
    this.cardData  ,
    this.isPublished ,
    this.isFeatured ,
    this.language ,
     super.id}){
    toJson() ;
  }

  factory ProductDataModel.fromJson(Map<String, dynamic> json , String id ) {
    return ProductDataModel(
      name: json[ "$nameKey"],
      image: json['$imageKey']??"",
      cardData: json['$cardDataKey']?? ""  ,
      isPublished: json['$isPublishedKey']?? false ,
      isFeatured: json['$isFeaturedKey']?? false ,
      language: json['$languageKey']?? "ar" ,
      id:  id ,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data[nameKey] = this.name;
    data[imageKey] = this.image;
    data[cardDataKey] = this.cardData?? {};
    data[isPublishedKey] = this.isPublished?? false;
    data[isFeaturedKey] = this.isFeatured?? false;
    data [languageKey] = this.language ?? "ar" ;
    return data;
  }


}