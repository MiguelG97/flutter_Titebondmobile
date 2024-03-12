import 'package:flutter/material.dart';
import 'package:mobile/core/shared/widgets/MAppbarNav.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/presenter/cart/widgets/MItemCart.dart';
import 'package:mobile/modules/store/presenter/cart/widgets/McheckoutPrice.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MColors.secondary_100,
      appBar: const MAppBarNav(
        toolbarHeight: 80,
        title: "My Cart",
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///missing overall paddin!
                      MItemCart(screenSize: screenSize),
                    ],
                  ),
                ),
              ),
            ),
            MCheckoutPrice(screenSize: screenSize)
          ],
        ),
      ),
    );
  }
}
