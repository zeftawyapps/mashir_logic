import 'package:JoDija_DataSource/utilis/firebase/firebase.dart';
import 'package:JoDija_DataSource/utilis/firebase/firebase_and_storage_action.dart';
import 'package:JoDija_DataSource/utilis/models/base_data_model.dart';
import 'package:JoDija_DataSource/utilis/models/remote_base_model.dart';
import 'package:JoDija_DataSource/utilis/result/result.dart';
import 'package:mashir_service/data/interface/offers_interface.dart';
import 'package:mashir_service/data/model/offers.dart';

class OffersDataSource implements IOffersDataSources {
  late FirestoreAndStorageActions _fireStoreAction;
  late FirebaseLoadingData _firebaseLoadingData;
  String _path = "offers";

  OffersDataSource() {
    _fireStoreAction = FirestoreAndStorageActions();
    _firebaseLoadingData = FirebaseLoadingData();
  }

  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel>> editOffer(String id, Object? file, OffersDataModel data)async  {
    var result =
    await _fireStoreAction.editeDataCloudFirestorWithUploadAndReplacement(
        path: _path, id: id, mymap: data!.toJson()
        , file: file
        , oldurl: data.image
        , imageField:  "image"! ) ;
    return Result.data(RemoteBaseModel(data: "data"));
  }

  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel<List<OffersDataModel>>>> getOffersList()async  {
    try {
          dataBuilder  (data, documentId) => OffersDataModel.fromJson(data!, documentId) ;
      var product = await _firebaseLoadingData.loadDataWithQuery<OffersDataModel>(
          path: _path, builder: dataBuilder!);
      return Result.data(RemoteBaseModel(data: product ));
    } on Exception catch (e) {
      return Result.error(RemoteBaseModel(message: e.toString()));
    }
  }
  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel<OffersDataModel>>> getOneOffer(String id)async  {
    try {
      dataBuilder  (data, documentId) => OffersDataModel.fromJson(data!, documentId)  ;
      var data = await _firebaseLoadingData.loadSingleDocData(_path, id);
      return Result.data(RemoteBaseModel(data:  dataBuilder(data, id) ));
    } on Exception catch (e) {
      return Result.error(RemoteBaseModel(message: e.toString()));
    }
  }
  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel>> setOffer(String id, Object? file, OffersDataModel data)async  {
    var result = await _fireStoreAction
        .addDataCloudFirestorWithUploadCollectionPathes(
        pathes: _path,
        mymap: data!.toJson(),
        id: id ,
        file: file,
        imageField:  "image"!);
    return Result.data(RemoteBaseModel(data: result));
  }
  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel>> startOffer(String id)async  {
    await _fireStoreAction.editeDataCloudFirestorWithUploadAndReplacement(
        path: _path, id: id, mymap: {"isStart":  true }) ;
    return Result.data(RemoteBaseModel(data: "done"));
  }
  @override
  stopOffer(String id)async  {
    await _fireStoreAction.editeDataCloudFirestorWithUploadAndReplacement(
        path: _path, id: id, mymap: {"isStart":  false  }) ;
    return Result.data(RemoteBaseModel(data: "done"));
  }
}