import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/shared/widgets/MIconButton.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/presenter/cart/screens/cart_screen.dart';
import 'package:mobile/modules/store/presenter/home/widgets/BottomNavigation_Clipper.dart';

class MBottomNavigationBar extends StatelessWidget {
  const MBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      // clipBehavior: Clip.none,
      // color: Colors.transparent,
      height: 110,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Stack(
            children: [
              //1) floating shopping button
              Positioned(
                top: 0,
                left: screenSize.width / 2 - 28,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 24,
                            color: MColors.primary.withOpacity(0.6),
                            offset: Offset(0, 8)),
                      ],
                      borderRadius: BorderRadius.circular(100),
                      color: MColors.primary),
                  width: 56,
                  height: 56,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Symbols.shopping_bag,
                      size: 25,
                      color: MColors.dark_100,
                    ),
                  ),
                ),
              ),

              //2) nav tool bar
              ClipPath(
                clipper: MBottomNavClipper(),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  width: screenSize.width,
                  color: Color(0xffFFFFFF), // Color(0xffFFFFFF)
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          MIconButton(
                            isActive: true,
                            icon: Symbols.home,
                            iconCallBack: () {},
                          ),
                          SizedBox(width: Constants.spaceBtwItems / 2),
                          MIconButton(
                            isActive: false,
                            icon: Symbols.favorite,
                            iconCallBack: () {},
                          )
                        ],
                      ),
                      Row(
                        children: [
                          MIconButton(
                            icon: Symbols.notifications,
                            iconCallBack: () {},
                          ),
                          SizedBox(width: Constants.spaceBtwItems / 2),
                          MIconButton(
                            icon: Symbols.person,
                            iconCallBack: () {},
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
