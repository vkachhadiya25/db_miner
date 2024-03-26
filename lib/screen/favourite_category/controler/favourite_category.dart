import 'package:db_miner/screen/model/db_model.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FavouriteCategoryController extends GetxController
{
  RxList<DBModel> favouriteCategoryList = <DBModel>[].obs;

  Future<void> favouriteCategoryData() async {
    List<DBModel> favouriteCategory = await DbHelper.dbHelper.readQuotesData();
    favouriteCategoryList.value = favouriteCategory;
  }
}