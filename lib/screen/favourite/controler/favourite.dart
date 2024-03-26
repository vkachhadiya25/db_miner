import 'package:db_miner/screen/home/model/home_model.dart';
import 'package:db_miner/screen/model/db_model.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList<DBModel> favouriteList = <DBModel>[].obs;

  Future<void> favouriteData() async {
    List<DBModel> favourite = await DbHelper.dbHelper.readQuotesData();
    favouriteList.value = favourite;
  }
}
