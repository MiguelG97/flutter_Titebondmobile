import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/theme/colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  final double toolbarHeight = 80;
  final double bottombarHeight = 100;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MColors.secondary_100,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: toolbarHeight,
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 18, bottom: 18, right: 16),
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: MColors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Symbols.arrow_back_ios,
                    color: MColors.iconDark,
                    size: 14,
                    grade: 200,
                    fill: 1,
                  )),
            ),
          ),
        ),
        title: Text(
          "Product Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Container(
              width: 44,
              decoration: BoxDecoration(
                  color: MColors.white,
                  borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Symbols.shopping_bag,
                    color: MColors.iconDark,
                    size: 24,
                  )),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: screenSize.width,
              // color: Colors.red,
              child: Text("data"),
            )),
            Container(
              height: bottombarHeight,
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}
