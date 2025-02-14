import 'package:JoDija_DataSource/utilis/models/base_data_model.dart';

class Cards extends BaseDataModel {
  String name;
  String image;
  Object? cardMape;

  String _nameKey = "name";
  String _imageKey = "image";
  String _cardMapeKey = "cardMape";

  Cards({ required this.name, required this.image, super.id
    , this.cardMape
  }) {
    toJson();
  }

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
        name: json[ "name"],
        image: json['image'],
        id: json['id'],
        cardMape: json['cardMape']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data[_nameKey] = this.name;
    data[_imageKey] = this.image;
    data[_cardMapeKey] = this.cardMape;
    return data;
  }
}