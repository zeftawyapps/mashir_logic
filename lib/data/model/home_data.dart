
import 'package:JoDija_reposatory/utilis/models/base_data_model.dart';

class LandingPageApiRespons  extends BaseEntityDataModel  {
  final Data data;
  final String status;
  final String? devMessage;

  LandingPageApiRespons({
    required this.data,
    required this.status,
    this.devMessage,
  });

  factory LandingPageApiRespons.fromJson(Map<String, dynamic> json) => LandingPageApiRespons(
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
    status: json['status'] as String,
    devMessage: json['devMessage'] as String?,
  );
}
class HomeCategory   extends BaseEntityDataModel  {

    String name;
    String image;
    String nemeEn ;

  HomeCategory({
      super.id ,
    required this.name,
    required this.nemeEn ,
    required this.image,
  });

  factory HomeCategory.fromJson(Map<String, dynamic> json) => HomeCategory(
    id: json['docId'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
    nemeEn: json['name_en'] ??""  as String  ,
  );
}
class FavorProduct  extends BaseEntityDataModel  {

  final String image;
  var data ;
  String lan = "ar";

  FavorProduct({
    super.id,
    required this.image,
    required this.lan ,
    this.data
  });

  factory FavorProduct.fromJson(Map<String, dynamic> json) => FavorProduct(
    id: json['id'] as String,
    image: json['image'] as String,
    data: json['data'] as String,
    lan: json['language']??"ar" as String,
  );
}
class Offer extends BaseEntityDataModel {
String image;

String title;
String baseLink;
String pramLink;

  Offer(
    {
      super.id,
      required this.image,
      required this.title,
      required this.baseLink,
      required this.pramLink,
    }
      ){}
  factory Offer.fromJson(Map<String, dynamic> json) => Offer(

    image: json['image'] as String,
    title: json['title'] as String,
    baseLink: json['baseLink'] as String,
    pramLink: json['pramLink'] as String,
  );

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['image'] = this.image;
    data['title'] = this.title;
    data['baseLink'] = this.baseLink;
    data['pramLink'] = this.pramLink;
    return data;
   }

}
class LoadData extends BaseEntityDataModel {
  final List<HomeCategory> categorys;
  final List<FavorProduct> favorPorducts;
  Offer offer;

  LoadData({
    required this.categorys,
    required this.favorPorducts,
    required this.offer,
  });

  factory LoadData.fromJson(Map<String, dynamic> json) => LoadData(
    categorys: List<HomeCategory>.from(
      json['categorys'].map((x) => HomeCategory.fromJson(x)),
    ),
    favorPorducts: List<FavorProduct>.from(
      json['favorPorducts'].map((x) => FavorProduct.fromJson(x)),
    ),
    offer: Offer.fromJson(json['offers'] as Map<String, dynamic>),

  );
}
class Data {
  final LoadData loadData;
  final String viewMode;

  Data({
    required this.loadData,
    required this.viewMode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    loadData: LoadData.fromJson(json['loadData'] as Map<String, dynamic>),
    viewMode: json['viewMode'] as String,
  );
}