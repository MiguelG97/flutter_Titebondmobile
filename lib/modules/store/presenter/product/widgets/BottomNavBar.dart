import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';

class MBottomNavBar extends StatelessWidget {
  const MBottomNavBar({
    super.key,
    required this.bottombarHeight,
  });

  final double bottombarHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 32,
                offset: Offset(0, -1),
                color: Colors.black.withOpacity(0.14),
              )
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            color: MColors.white),
        height: bottombarHeight,
        child: Row(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: MColors.gray.withOpacity(0.4),
                // border: Border.all(
                //   width: 1.5,
                //   color: MColors.dark_300,
                // ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                  onPressed: () {
                    print("hi");
                  },
                  icon: Icon(
                    Symbols.favorite,
                    weight: 500,
                    color: MColors.dark_100,
                  )),
            ),
            SizedBox(
              width: Constants.spaceBtwItems,
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: MColors.primary),
                  onPressed: () {},
                  child: Text("Add To Cart",
                      style: GoogleFonts.raleway(
                        color: MColors.dark_100,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
