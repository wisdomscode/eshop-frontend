import 'package:eshop/bottom_nav_bar.dart';
import 'package:eshop/constants/colors.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BottomNavBarScreen(),
          ),
        );
      },
      icon: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.0,
            color: kprimaryColor,
          ),
          image: const DecorationImage(
            image: AssetImage(
              "images/applogo.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
