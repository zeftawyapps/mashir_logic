import 'package:JoDija_reposatory/constes/api_urls.dart';
import 'package:JoDija_reposatory/utilis/http_remotes/http_client.dart';
import 'package:JoDija_reposatory/utilis/http_remotes/http_methos_enum.dart';
import 'package:JoDija_reposatory/utilis/models/base_data_model.dart';
import 'package:JoDija_reposatory/utilis/models/remote_base_model.dart';
import 'package:JoDija_reposatory/utilis/models/staus_model.dart';
import 'package:JoDija_reposatory/utilis/result/result.dart';
import 'package:dio/dio.dart';


class LandingPageSource {


  Future<Result<RemoteBaseModel , Map<String , dynamic > >> getLandingPages() async {
    // Fetch data from API
    var result = await HttpClient(userToken: false).sendRequest(
        method: HttpMethod.GET,
        url: ApiUrls.BASE_URL + "/landingPage",
        cancelToken: CancelToken());
    if (result.data!.status == StatusModel.success) {
      var data  = result.data!.data!   as Map<String , dynamic >  ;
      return  Result<RemoteBaseModel , Map<String , dynamic > >(data: data);
    }else {
      return Result<RemoteBaseModel ,  Map<String , dynamic >>(error: RemoteBaseModel(message: result.data!.message , status: result.data!.status));
    }


  }
}

