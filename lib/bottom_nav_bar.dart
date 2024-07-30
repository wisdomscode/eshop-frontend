import 'package:eshop/constants/colors.dart';
import 'package:eshop/screens/cart/cart_screen.dart';
import 'package:eshop/screens/favorite/favorites_screen.dart';
import 'package:eshop/screens/history/history_screen.dart';
import 'package:eshop/screens/home/home_screen.dart';
import 'package:eshop/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentPage = 2;
  List pages = const [
    HistoryScreen(),
    CartScreen(),
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentPage = 2;
          });
        },
        backgroundColor: kprimaryColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.home,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        height: 60,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
              icon: Icon(
                currentPage == 0 ? Icons.grid_view_rounded : Icons.grid_view_outlined,
                size: 30,
                color: currentPage == 0 ? kprimaryColor : Colors.grey.shade600,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
              icon: Icon(
                currentPage == 1 ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                size: 30,
                color: currentPage == 1 ? kprimaryColor : Colors.grey.shade600,
              ),
            ),
            const SizedBox(width: 30),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 3;
                });
              },
              icon: Icon(
                currentPage == 3 ? Icons.favorite : Icons.favorite_border_outlined,
                size: 30,
                color: currentPage == 3 ? kprimaryColor : Colors.grey.shade600,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 4;
                });
              },
              icon: Icon(
                currentPage == 4 ? Icons.person : Icons.person_2_outlined,
                size: 30,
                color: currentPage == 4 ? kprimaryColor : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
      body: pages[currentPage],
    );
  }
}
