import 'package:JoDija_reposatory/interface/repo/crud_repo.dart';
import 'package:JoDija_reposatory/interface/sources/i_json_base_source.dart';
import 'package:JoDija_reposatory/utilis/models/remote_base_model.dart';
import 'package:JoDija_reposatory/utilis/models/staus_model.dart';
import 'package:JoDija_reposatory/utilis/result/result_data_indecator.dart';
import 'package:mashir_service/data/model/product.dart';

import '../model/category.dart';
 class ProductsRepo  implements IBaseDataSourceRepo<ProductDataModel> {
   IBaseDataActionsSource _baseDataSourceRepo;

   ProductsRepo(this._baseDataSourceRepo);

   @override
   Future<RemoteBaseModel> addData() async {
     var data = await _baseDataSourceRepo.addDataItem();
     return resultDataHelper.getResulInput(data);
   }

   @override
   Future<RemoteBaseModel> deleteData(String id) async {
     var data = await _baseDataSourceRepo.deleteDataItem(id);
     return resultDataHelper.getResulInput(data);
   }

   @override
   Future<RemoteBaseModel<List<ProductDataModel>>> getListData() async {
     var result = await _baseDataSourceRepo.getDataList();
     if (result.error != null) {
      return  RemoteBaseModel(error: result.error,
           status: StatusModel.error,
           message: result.error!.message);
     } else{
       return resultDataHelper.getResultOfListData(
           result!.data! , (data) => ProductDataModel.fromJson(data!.map! , data.id!
       ));
   }
   }




  @override
  Future<RemoteBaseModel<ProductDataModel>> getSingleData(String id)async  {
    var result  =  await  _baseDataSourceRepo.getSingleData(id);
    return resultDataHelper.getResultOfData(result, (data) => 
        ProductDataModel.fromJson(data!, id ));
  }

  @override
  Future<RemoteBaseModel> updateData(String id) async {
    var   data = await  _baseDataSourceRepo.editeDataItem(id);
    return  resultDataHelper.getResulInput(data );
     }
  ResultDataHelper<ProductDataModel> get resultDataHelper  => ResultDataHelper<ProductDataModel>();
}