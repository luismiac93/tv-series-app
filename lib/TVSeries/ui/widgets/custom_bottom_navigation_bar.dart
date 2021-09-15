import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/TVSeries/repository/ui_repository.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiRepository = Provider.of<UIRepository>(context);
    final currentIndex = uiRepository.itemSelected;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        uiRepository.itemSelected = value;
      },
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.white,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Icon(Icons.home)),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(Icons.favorite),
            ),
            label: 'Favorites'),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(Icons.history),
            ),
            label: 'Recent'),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(Icons.search),
            ),
            label: 'Search'),
      ],
    );
  }
}
