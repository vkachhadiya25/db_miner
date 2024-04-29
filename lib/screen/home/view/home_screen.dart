import 'package:db_miner/screen/home/controler/home_controler.dart';
import 'package:db_miner/screen/model/db_model.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:db_miner/utils/share_helper.dart';
import 'package:db_miner/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.dbgetData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Quotes",
            style: TextStyle(fontSize: 28),
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      child: Row(
                    children: [
                      Obx(
                        () => Switch(
                          value: controller.islight.value,
                          onChanged: (value) {
                            ShareHelper shr = ShareHelper();
                            shr.setTheme(value);
                            controller.changeTheme();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Theme"),
                    ],
                  )),
                  PopupMenuItem(
                      child: InkWell(
                    onTap: () {
                      Get.toNamed('favourite');
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.category),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Favourite Quotes"),
                      ],
                    ),
                  )),
                  PopupMenuItem(
                      child: InkWell(
                    onTap: () {
                      Get.toNamed('favouriteCategory');
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Favourite Category"),
                      ],
                    ),
                  )),
                ];
              },
            )
          ],
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.dbList.length,
            itemExtent: 160,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed('detail', arguments: controller.dbList[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade50),
                        color: controller.randomColor()),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${controller.dbList[index].name}",
                                style: txtBold,
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    DbHelper.dbHelper.insertCategoryData(
                                        controller.dbList[index].name!);
                                    for (int i = 0;
                                    i <
                                        controller
                                            .dbList[index].quotesList!.length;
                                    i++) {
                                      DbHelper.dbHelper.insertNameData(
                                        DBModel(
                                            name: controller.dbList[index].name,
                                            author: controller
                                                .dbList[index].authorList![i],
                                            quotes: controller
                                                .dbList[index].quotesList![i]),
                                      );
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 32,
                                  )),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "${controller.dbList[index].image}",
                              fit: BoxFit.cover,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
