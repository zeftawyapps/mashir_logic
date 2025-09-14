import 'package:JoDija_reposatory/utilis/models/remote_base_model.dart';
import 'package:JoDija_reposatory/utilis/models/staus_model.dart';

import '../source/landing_page_source.dart';

class LandingRepo {

 late  LandingPageSource _landingPageSource ;
  LandingRepo(){
    _landingPageSource = LandingPageSource();
  }
  Future<RemoteBaseModel<Map<String , dynamic >>> getLandingData() async {
    var respo = await _landingPageSource.getLandingPages();
    if (respo.error != null) {
      return RemoteBaseModel(data: {
      }, status: StatusModel.error);
    }
    return RemoteBaseModel(data:
      respo.data
    , status: StatusModel.success);
  }
}