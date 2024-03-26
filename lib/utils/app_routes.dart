import 'package:db_miner/screen/detail/view/detail_screen.dart';
import 'package:db_miner/screen/favourite/view/favourite_screen.dart';
import 'package:db_miner/screen/favourite_category/view/favourite_category_screen.dart';
import 'package:db_miner/screen/home/view/home_screen.dart';
import 'package:db_miner/screen/quotes_detail/view/quotes_detail_screen.dart';
import 'package:db_miner/screen/splesh/view/splesh_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes =
{
  '/' : (context) => const SpleshScreen(),
  'home' : (context) => const HomeScreen(),
  'detail' : (context) => const DetailScreen(),
  'favourite' : (context) => const FavoriteScreen(),
  'favouriteCategory' : (context) => const FavouriteCategoryScreen(),
  'quotesDetail' : (context) => const QuotesDetailScreen(),

};