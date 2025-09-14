import 'package:JoDija_reposatory/utilis/models/base_data_model.dart';

class SuggetModel extends BaseEntityDataModel  {
  String email ;
  String phone  ;
  String massage ;
  SuggetModel({
    required this.email,
    required this.phone,
    required this.massage,
  });
  // josn
  factory SuggetModel.fromJson(Map<String, dynamic> json) => SuggetModel(
    email: json['email'] as String,
    phone: json['phone'] as String,
    massage: json['massage'] as String,
  );
  // to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['massage'] = this.massage;
    return data;
  }
}