import 'package:JoDija_reposatory/model/user/base_model/inhertid_models/user_model.dart';
import 'package:JoDija_reposatory/utilis/models/base_data_model.dart';

import '../../consts/values/user_type.dart';

class UserData   extends  UserModule  {

  String userType;
  String _nameKey = "name";
  String _emailKey = "email";
  String _phoneKey = "phone";
  String _userTypeKey = "userType";
  String _profileImgKey = "imguri";
String image = "";
bool isDataComplate = false;
  UserData(
      {  super.name,
        super.email,
        super.phone ,
        this.image = "",
       super.token = "",
      super.id,
      this.userType = UserType.user,
      this.isDataComplate = false
      }) {
   map = toJson();
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        name: json["name"],
        email: json['email'],
        userType: json['userType']??UserType.user,

        image: json["imguri"]??"",
        phone: json['phone'],
        token: json['token']??"",
        isDataComplate: json['isDataComplate']??false,
        id: json['uid']) ;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data[_nameKey] = this.name;
    data[_emailKey] = this.email;
    data[_userTypeKey] = this.userType;
    data[_phoneKey] = this.phone;
    data[_profileImgKey] = this.image;
    data['isDataComplate'] = this.isDataComplate;
    data['token'] = this.token??"";

    return data;
  }

  @override
  String? id;
}
