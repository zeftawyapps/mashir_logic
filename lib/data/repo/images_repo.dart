import 'package:JoDija_reposatory/utilis/models/remote_base_model.dart';
import 'package:JoDija_reposatory/utilis/models/staus_model.dart';
import 'package:JoDija_reposatory/utilis/result/result_data_indecator.dart';
import 'package:mashir_service/data/model/images.dart';
import 'package:mashir_service/data/model/offers.dart';

import '../interface/offers_interface.dart';

class ImagesRepo {
  IImagesDataSources _baseDataSourceRepo;

  ImagesRepo(this._baseDataSourceRepo);
  Future<RemoteBaseModel> addData(
      Object file, ImagesDataModel data) async {
    var resultData = await _baseDataSourceRepo.setImages(  file, data);
    return RemoteBaseModel(data: resultData.data, status: StatusModel.success);
  }


  Future<RemoteBaseModel> addDataWithId(
      Object file, ImagesDataModel data ,String id ) async {
    var resultData = await _baseDataSourceRepo.setImagesId(  file, data , id );
    return RemoteBaseModel(data: resultData.data, status: StatusModel.success);
  }



  Future<RemoteBaseModel> deleteData(String id) async {
    var resultData = await _baseDataSourceRepo.deleteImages(id);
    return RemoteBaseModel(data: resultData.data, status: StatusModel.success);
  }

  Future<RemoteBaseModel<List<ImagesDataModel>>> getListData() async {
    var result = await _baseDataSourceRepo.getImagesList();
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

  Future<RemoteBaseModel<ImagesDataModel>> getSingleData(String id) async {
    var result = await _baseDataSourceRepo.getOneImages(id);
    return RemoteBaseModel(
        data: result.data!.data!, status: StatusModel.success);
  }

}
