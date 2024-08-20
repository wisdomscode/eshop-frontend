import 'package:eshop/constants/colors.dart';
import 'package:eshop/models/product_model.dart';
import 'package:eshop/screens/home/widgets/image_slider.dart';
import 'package:eshop/screens/home/widgets/product_card_widget.dart';
import 'package:eshop/screens/home/widgets/product_categories.dart';
import 'package:eshop/screens/widgets/app_logo.dart';
import 'package:eshop/screens/widgets/custom_app_bar.dart';
import 'package:eshop/screens/widgets/text_widget.dart';
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
        appBar: const CustomAppBar(
          leading: AppLogo(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
            child: Column(
              children: [
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
                const ProductCategoryWidget(),

                const SizedBox(height: 20),
                // products
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Special Products',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      text: 'See All',
                      fontSize: 16,
                    ),
                  ],
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: allProducts[index]);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
