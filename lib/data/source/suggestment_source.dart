import 'package:JoDija_DataSource/utilis/firebase/firebase.dart';
import 'package:JoDija_DataSource/utilis/firebase/firebase_and_storage_action.dart';
import 'package:JoDija_DataSource/utilis/models/remote_base_model.dart';
import 'package:JoDija_DataSource/utilis/result/result.dart';
import 'package:mashir_service/data/interface/offers_interface.dart';
import 'package:mashir_service/data/model/suggesment_model.dart';

class SuggestmentSource extends ISuggestmentSource{


  late FirestoreAndStorageActions _fireStoreAction;
  late FirebaseLoadingData _firebaseLoadingData;
  String _path = "suggestment";

  SuggestmentSource() {
    _fireStoreAction = FirestoreAndStorageActions();
    _firebaseLoadingData = FirebaseLoadingData();
  }

  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel<SuggetModel>>> getOneSuggestment(String id)async {

    try {
      dataBuilder  (data, documentId) => SuggetModel.fromJson(data!  ) ;
      var data = await _firebaseLoadingData.loadSingleDocData(_path, id);
      return Result.data(RemoteBaseModel(data:  dataBuilder(data, id) ));
    } on Exception catch (e) {
      return Result.error(RemoteBaseModel(message: e.toString()));
    }

  }

  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel<List<SuggetModel>>>> getSuggestmentList()async  {
    try {
      dataBuilder  (data, documentId) => SuggetModel.fromJson(data! ) ;
      var product = await _firebaseLoadingData.loadDataWithQuery<SuggetModel>(
          path: _path, builder: dataBuilder!);
      return Result.data(RemoteBaseModel(data: product ));
    } on Exception catch (e) {
      return Result.error(RemoteBaseModel(message: e.toString()));
    }
  }

  @override
  Future<Result<RemoteBaseModel, RemoteBaseModel>> setSuggestment(SuggetModel data)async  {
    var result = await _fireStoreAction
        .addDataCloudFirestorWithUploadCollectionPathes(
        pathes: _path,
        mymap: data!.toJson(),
         );
    return Result.data(RemoteBaseModel(data: result));
  }
}