import 'package:JoDija_reposatory/utilis/models/remote_base_model.dart';
import 'package:JoDija_reposatory/utilis/models/staus_model.dart';
import 'package:JoDija_reposatory/utilis/result/result_data_indecator.dart';
import 'package:mashir_service/data/model/offers.dart';

import '../interface/offers_interface.dart';

class OffersRepo {
  IOffersDataSources _baseDataSourceRepo;

  OffersRepo(this._baseDataSourceRepo);
  Future<RemoteBaseModel> addData(
      String id, Object? file, OffersDataModel data) async {
    var resultData = await _baseDataSourceRepo.setOffer(id, file, data);
    return RemoteBaseModel(data: resultData.data, status: StatusModel.success);
  }

  Future<RemoteBaseModel> deleteData(String id) async {
    var resultData = await _baseDataSourceRepo.stopOffer(id);
    return RemoteBaseModel(data: resultData.data, status: StatusModel.success);
  }

  Future<RemoteBaseModel<List<OffersDataModel>>> getListData() async {
    var result = await _baseDataSourceRepo.getOffersList();
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

  Future<RemoteBaseModel<OffersDataModel>> getSingleData(String id) async {
    var result = await _baseDataSourceRepo.getOneOffer(id);
    return RemoteBaseModel(
        data: result.data!.data!, status: StatusModel.success);
  }

}
