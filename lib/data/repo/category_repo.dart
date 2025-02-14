import 'package:JoDija_DataSource/interface/repo/crud_repo.dart';
import 'package:JoDija_DataSource/interface/sources/i_json_base_source.dart';
import 'package:JoDija_DataSource/utilis/models/remote_base_model.dart';
import 'package:JoDija_DataSource/utilis/models/staus_model.dart';
import 'package:JoDija_DataSource/utilis/result/result_data_indecator.dart';
import '../model/category.dart';

 class CategoryRepo  implements IBaseDataSourceRepo<CategoryDataModel> {
   IBaseDataActionsSource _baseDataSourceRepo;
   CategoryRepo(this._baseDataSourceRepo);
   @override
   Future<RemoteBaseModel> addData() async {
     var data = await _baseDataSourceRepo.addDataItem();
     return resultDataHelper.getResulInputt(data);
   }

   @override
   Future<RemoteBaseModel> deleteData(String id) async {
     var data = await _baseDataSourceRepo.deleteDataItem(id);
     return resultDataHelper.getResulInputt(data);
   }

   @override
   Future<RemoteBaseModel<List<CategoryDataModel>>> getListData() async {
     var result = await _baseDataSourceRepo.getDataList();

     if (result.error != null) {
      return  RemoteBaseModel(error: result.error,
           status: StatusModel.error,
           message: result.error!.message);

     } else{

       return resultDataHelper.getResultOfListData(
           result!.data! , (data) => CategoryDataModel.fromJson(data!.map! , data.id!
       ));
   }
   }

  @override
  Future<RemoteBaseModel<CategoryDataModel>> getSingleData(String id)async  {
    var result  =  await  _baseDataSourceRepo.getDataList();
    return resultDataHelper.getResultOfData(result, (data) => CategoryDataModel.fromJson(data!, id ));
  }

  @override
  Future<RemoteBaseModel> updateData(String id) async {
    var   data = await  _baseDataSourceRepo.editeDataItem(id);
    return  resultDataHelper.getResulInputt(data );
     }
  ResultDataHelper<CategoryDataModel> get resultDataHelper  => ResultDataHelper<CategoryDataModel>();
}