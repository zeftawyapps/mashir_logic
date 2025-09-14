import 'package:JoDija_reposatory/utilis/models/remote_base_model.dart';
import 'package:JoDija_reposatory/utilis/models/staus_model.dart';
import 'package:mashir_service/data/model/suggesment_model.dart';

import '../interface/offers_interface.dart';
import '../source/landing_page_source.dart';

class SuggestmentRepo {

  ISuggestmentSource _baseDataSourceRepo;

  SuggestmentRepo(this._baseDataSourceRepo);
  Future<RemoteBaseModel> addSuggestment(
       SuggetModel data) async {
    var resultData = await _baseDataSourceRepo.setSuggestment(   data);
    return RemoteBaseModel(data: resultData.data, status: StatusModel.success);
  }

  Future<RemoteBaseModel<List<SuggetModel>>> getListData() async {
    var result = await _baseDataSourceRepo.getSuggestmentList();
    if (result.error != null) {
      return RemoteBaseModel(
          error: result.error,
          status: StatusModel.error,
          message: result.error!.message);
    } else {
      return RemoteBaseModel(
          data: result.data!.data!, status: StatusModel.success);
    }
  }

  Future<RemoteBaseModel<SuggetModel>> getSingleData(String id) async {
    var result = await _baseDataSourceRepo.getOneSuggestment(id);
    return RemoteBaseModel(
        data: result.data!.data!, status: StatusModel.success);
  }
}