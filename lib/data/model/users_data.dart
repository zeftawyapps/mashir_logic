import 'package:JoDija_reposatory/model/user/base_model/inhertid_models/user_model.dart';
import 'package:JoDija_reposatory/utilis/models/base_data_model.dart';

import '../../consts/values/user_type.dart';

class UsersDataToAdmin   extends  BaseEntityDataModel   {

  String userType;
  String _nameKey = "name";
  String _emailKey = "email";
  String _phoneKey = "phone";
  String _userTypeKey = "userType";
  String _profileImgKey = "profileImg";



  String? uid ;
  String? name;
  String? email;
  String? token;
  String? phone;

String image = "";
bool isDataComplate = false;
  UsersDataToAdmin(
      {  this.name,
        this.email,
        this.phone ,
        this.image = "",
        this.uid ,

      super.id,
      this.userType = UserType.user,
      this.isDataComplate = false
      }) {
   map = toJson();
  }

  factory UsersDataToAdmin.fromJson(Map<String, dynamic> json , String? id ) {
    return UsersDataToAdmin(
        name: json["name"],
        email: json['email'],
        userType: json['userType']??UserType.user,
        image: json["profileImg"]??"",
        phone: json['phone'],
        uid: json['uid'],

        isDataComplate: json['isDataComplate']??false,
        id:  id ) ;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data[_nameKey] = this.name;
    data[_emailKey] = this.email;
    data[_userTypeKey] = this.userType;
    data[_phoneKey] = this.phone;
    data[_profileImgKey] = this.image;
    data['isDataComplate'] = this.isDataComplate;

    return data;
  }

  @override
  String? id;
}
