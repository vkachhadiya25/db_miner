import 'package:db_miner/screen/favourite/controler/favourite.dart';
import 'package:db_miner/screen/favourite_category/controler/favourite_category.dart';
import 'package:db_miner/screen/home/controler/home_controler.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class FavouriteCategoryScreen extends StatefulWidget {
  const FavouriteCategoryScreen({super.key});

  @override
  State<FavouriteCategoryScreen> createState() =>
      _FavouriteCategoryScreenState();
}

class _FavouriteCategoryScreenState extends State<FavouriteCategoryScreen> {
  FavouriteCategoryController favouriteCategoryController =
      Get.put(FavouriteCategoryController());
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    favouriteCategoryController.favouriteCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Favourite Category"),
        ),
        body: ListView.builder(
          itemExtent: 120,
          itemCount: favouriteCategoryController.favouriteCategoryList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: controller.randomColor(),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "${favouriteCategoryController.favouriteCategoryList[index].name}"),
                    IconButton(
                        onPressed: () {
                          DbHelper.dbHelper.deleteCategoryData(
                              id: "${favouriteCategoryController.favouriteCategoryList[index].id}");
                          favouriteCategoryController.favouriteCategoryData();
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
