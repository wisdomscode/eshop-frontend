import 'package:eshop/constants/colors.dart';
import 'package:eshop/screens/home/widgets/image_slider.dart';
import 'package:eshop/screens/home/widgets/product_categories.dart';
import 'package:eshop/screens/mainWidgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
        child: Column(
          children: [
            const CustomAppBar(),

            const SizedBox(height: 20),
            // Search Text Field
            TextFormField(
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(5),
                prefixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
                suffix: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    height: 20,
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                fillColor: kprimaryBackgroungColor,
                filled: true,
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Scroll banner
            MyImageSlider(
              currentSlide: currentSlider,
              onChnage: (value) {
                setState(() {
                  currentSlider = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Categories
            ProductCategoryWidget()
          ],
        ),
      ),
    ));
  }
}
