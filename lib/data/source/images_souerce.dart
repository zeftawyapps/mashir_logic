import 'package:JoDija_reposatory/utilis/firebase/firebase.dart';
import 'package:JoDija_reposatory/utilis/firebase/firebase_and_storage_action.dart';
import 'package:JoDija_reposatory/utilis/models/base_data_model.dart';
import 'package:JoDija_reposatory/utilis/models/remote_base_model.dart';
import 'package:JoDija_reposatory/utilis/result/result.dart';
import 'package:mashir_service/data/interface/offers_interface.dart';
import 'package:mashir_service/data/model/images.dart';
import 'package:mashir_service/data/model/offers.dart';

class ImagesDataSource implements IImagesDataSources {
  late FirestoreAndStorageActions _fireStoreAction;
  late FirebaseLoadingData _firebaseLoadingData;
  String path = "images";

  ImagesDataSource({this.path = "images"}) {

    _fireStoreAction = FirestoreAndStorageActions();
    _firebaseLoadingData = FirebaseLoadingData();
  }

  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel>> editImages(String id, Object? file, ImagesDataModel data)async  {
    var result =
    await _fireStoreAction.editeDataCloudFirestorWithUploadAndReplacement(
        path: path, id: id, mymap: data!.toJson()
        , file: file
        , oldurl: data.image
        , imageField:  "image"! ) ;
    return Result.data(RemoteBaseModel(data: "data"));
  }

  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel<List<ImagesDataModel>>>> getImagesList()async  {
    try {
          dataBuilder  (data, documentId) => ImagesDataModel.fromJson(data!, documentId) ;
      var product = await _firebaseLoadingData.loadDataWithQuery<ImagesDataModel>(
          path: path, builder: dataBuilder!);
      return Result.data(RemoteBaseModel(data: product ));
    } on Exception catch (e) {
      return Result.error(RemoteBaseModel(message: e.toString()));
    }
  }
  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel<ImagesDataModel>>> getOneImages(String id)async  {
    try {
      dataBuilder  (data, documentId) => ImagesDataModel.fromJson(data!, documentId)  ;
      var data = await _firebaseLoadingData.loadSingleDocData(path, id);
      return Result.data(RemoteBaseModel(data:  dataBuilder(data, id) ));
    } on Exception catch (e) {
      return Result.error(RemoteBaseModel(message: e.toString()));
    }
  }
  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel>> setImages( Object file, ImagesDataModel data)async  {
    var result = await _fireStoreAction
        .addDataCloudFirestorWithUploadCollectionPathes(
        pathes: path,
        mymap: data!.toJson(),

        file: file,
        imageField:  "image"!);
    return Result.data(RemoteBaseModel(data: result));
  }
  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel>> startImages(String id)async  {
    await _fireStoreAction.editeDataCloudFirestorWithUploadAndReplacement(
        path: path, id: id, mymap: {"isStart":  true }) ;
    return Result.data(RemoteBaseModel(data: "done"));
  }
  @override
  Future <Result<RemoteBaseModel, RemoteBaseModel>>  deleteImages(String id)async  {
    await _fireStoreAction.deleteDataCloudFirestoreOneDocument(path: path, id: id) ;
    return Result.data(RemoteBaseModel(data: "done"));
  }

  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel>> setImagesId(Object file, ImagesDataModel data, String id)async {
    var result = await _fireStoreAction
        .addDataCloudFirestorWithUploadCollectionPathes(
        pathes: path,
        mymap: data!.toJson(),
        id: id,
        file: file,
        imageField:  "image"!);
    return Result.data(RemoteBaseModel(data: result));
  }
}