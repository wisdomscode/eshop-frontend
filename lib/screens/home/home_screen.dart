import 'package:eshop/constants/colors.dart';
import 'package:eshop/screens/mainWidgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
        child: Column(
          children: [
            const CustomAppBar(),

            SizedBox(height: 20),
            // Search Text Field
            TextFormField(
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(5),
                prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
                suffix: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    height: 18,
                    width: 2,
                    color: kprimaryColor,
                  ),
                ),
                fillColor: kcontentColor,
                filled: true,
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
