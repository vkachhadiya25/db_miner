import 'package:db_miner/screen/favourite/controler/favourite.dart';
import 'package:db_miner/screen/home/controler/home_controler.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:db_miner/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavouriteController favouriteControler = Get.put(FavouriteController());
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    favouriteControler.favouriteData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Favourite Quotes"),
        ),
        body: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.randomColor()),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            "${favouriteControler.favouriteList[index].quotes}",
                            style: txtMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          "${favouriteControler.favouriteList[index].author}",
                          style: txtMedium,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                DbHelper.dbHelper.deleteQuotesData(
                                    id: "${favouriteControler.favouriteList[index].id}");
                                favouriteControler.favouriteData();
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: favouriteControler.favouriteList.length,
            itemExtent: 170,
          ),
        ),
      ),
    );
  }
}
