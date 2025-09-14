import 'package:JoDija_reposatory/utilis/models/remote_base_model.dart';
import 'package:JoDija_reposatory/utilis/result/result.dart';
import 'package:mashir_service/data/model/images.dart';
import 'package:mashir_service/data/model/offers.dart';

import '../model/suggesment_model.dart';

abstract  class IOffersDataSources{
  Future<Result<RemoteBaseModel, RemoteBaseModel>> setOffer(String id , Object? file , OffersDataModel data  );
  Future <Result<RemoteBaseModel, RemoteBaseModel>> editOffer(String id , Object? file , OffersDataModel data);
  Future <Result<RemoteBaseModel, RemoteBaseModel>> startOffer(String id);
  Future <Result<RemoteBaseModel, RemoteBaseModel>> stopOffer(String id);
  Future <Result<RemoteBaseModel, RemoteBaseModel<List<OffersDataModel>>  >> getOffersList();
  Future <Result<RemoteBaseModel, RemoteBaseModel<OffersDataModel>>> getOneOffer(String id);
}


abstract class ISuggestmentSource {
  Future<Result<RemoteBaseModel, RemoteBaseModel>> setSuggestment(   SuggetModel data  );

  Future <Result<RemoteBaseModel, RemoteBaseModel<List<SuggetModel>>  >> getSuggestmentList();
  Future <Result<RemoteBaseModel, RemoteBaseModel<SuggetModel>>> getOneSuggestment(String id);
}


abstract  class IImagesDataSources{
  Future<Result<RemoteBaseModel, RemoteBaseModel>> setImages(  Object file , ImagesDataModel data  );
  Future<Result<RemoteBaseModel, RemoteBaseModel>> setImagesId(  Object file , ImagesDataModel data ,String id  );

  Future <Result<RemoteBaseModel, RemoteBaseModel>> editImages(String id , Object? file , ImagesDataModel data);
  Future <Result<RemoteBaseModel, RemoteBaseModel>> startImages(String id);
  Future <Result<RemoteBaseModel, RemoteBaseModel>> deleteImages(String id);
  Future <Result<RemoteBaseModel, RemoteBaseModel<List<ImagesDataModel>>  >> getImagesList();
  Future <Result<RemoteBaseModel, RemoteBaseModel<ImagesDataModel>>> getOneImages(String id);
}