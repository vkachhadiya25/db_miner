import 'dart:math';

import 'package:db_miner/screen/home/model/home_model.dart';
import 'package:db_miner/utils/color.dart';
import 'package:db_miner/utils/json_helper.dart';
import 'package:db_miner/utils/share_helper.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<HomeModel> dbList = <HomeModel>[].obs;
  RxBool islight = false.obs;

  Future<void> dbgetData() async {
    List<HomeModel>? l1 = await JsonHelper.jsonHelper.jsonToModel();
    dbList.value = l1;
  }

  void changeTheme() async {
    ShareHelper shr = ShareHelper();
    bool? istheme = await shr.getTheme();
    islight.value = istheme ?? false;
  }

  randomColor() {
    Random random = Random();
    return color[random.nextInt(color.length)];
  }

  void copy(String quotes) {
    Clipboard.setData(ClipboardData(text: quotes));
  }
}
