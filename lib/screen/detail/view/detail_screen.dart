import 'package:db_miner/screen/home/controler/home_controler.dart';
import 'package:db_miner/screen/home/model/home_model.dart';
import 'package:db_miner/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeModel h1 = Get.arguments;
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("${h1.name}"),
          actions: const [
            SizedBox(width: 50, child: Icon(Icons.settings)),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed('quotesDetail', arguments: [
                    h1.name![index],
                    h1.quotesList![index],
                    h1.authorList![index],
                  ]);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey.shade50),
                      color: controller.randomColor()),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            "${h1.quotesList![index]}",
                            style: txtMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${h1.authorList![index]}",
                          style: txtMedium,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: h1.quotesList!.length,
          itemExtent: 160,
        ),
      ),
    );
  }
}
