import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:db_miner/screen/favourite/controler/favourite.dart';
import 'package:db_miner/screen/home/controler/home_controler.dart';
import 'package:db_miner/screen/model/db_model.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class QuotesDetailScreen extends StatefulWidget {
  const QuotesDetailScreen({super.key});

  @override
  State<QuotesDetailScreen> createState() => _QuotesDetailScreenState();
}

class _QuotesDetailScreenState extends State<QuotesDetailScreen> {
  List l1 = Get.arguments as List;
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
          title: const Text("Quotes Detail"),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.toNamed('favourite');
                          },
                          icon: const Icon(Icons.favorite_rounded)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Favourite"),
                    ],
                  )),
                  PopupMenuItem(
                      child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.copy)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Copy Quotes"),
                    ],
                  )),
                ];
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText(
                  "${l1[1]}",
                  speed: const Duration(milliseconds: 100),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ]),
              const SizedBox(
                height: 50,
              ),
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText(
                  "${l1[2]}",
                  speed: const Duration(milliseconds: 100),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ]),
              const Spacer(),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.11,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit)),
                          const Text("Edit")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.copy(l1[1]);
                                Get.back();
                                Get.snackbar("Copy Quotes",
                                    'Successfully copy to quotes.');
                              },
                              icon: const Icon(Icons.copy)),
                          const Text("Copy")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                DBModel dbModel = DBModel(
                                  name: l1[1],
                                  quotes: l1[2],
                                  author: l1[3],
                                );
                                DbHelper.dbHelper.insertQuotesData(dbModel);
                                Get.back();
                                favouriteControler.favouriteData();
                              },
                              icon: const Icon(Icons.favorite)),
                          const Text("Like")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.save)),
                          const Text("save")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: controller.randomColor(),
      ),
    );
  }
}
