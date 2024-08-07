import 'package:feirapp/src/presenter/favorites/page/favorites_page.dart';
import 'package:feirapp/src/presenter/home/page/home_page.dart';
import 'package:feirapp/src/presenter/profile/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_assets.dart';
import 'package:feirapp/src/presenter/search/page/search_page.dart';

class MainController extends ChangeNotifier {
  int indexSelected = 0;

  final List<Widget> widgets = [
    const HomePage(),
    const FavoritesPage(),
    const SearchPage(),
    Container(),
    const ProfilePage(),
  ];

  final List<String> iconsAssets = [
    AppAssets.homeIcon,
    AppAssets.bookmarkIcon,
    AppAssets.searchIcon,
    AppAssets.bagIcon,
    AppAssets.userIcon,
  ];

  bool loading = true;

  void selectedIndex(int index) {
    indexSelected = index;
    notifyListeners();
  }

  Future<void> init() async {
    loading = true;
    notifyListeners();

    loading = false;
    notifyListeners();
  }
}
