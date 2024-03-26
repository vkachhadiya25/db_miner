
import 'package:db_miner/screen/home/controler/home_controler.dart';
import 'package:db_miner/utils/app_routes.dart';
import 'package:db_miner/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main(){
  HomeController controller=Get.put(HomeController());
  controller.changeTheme();
  runApp(
      Obx(
            () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: controller.islight.value?lightTheme:darkTheme,
          routes: app_routes,
        ),
      )
  );
}