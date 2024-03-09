import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';

class MCategoryChips extends StatelessWidget {
  const MCategoryChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MColors.secondary_100,
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                label: Container(
                    width: 100,
                    height: 40,
                    child: Center(
                        child: Text(
                      Constants.productCategories[index],
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: MColors.iconDark),
                    ))),
                backgroundColor: index == 1 ? MColors.primary : MColors.white,
                color: MaterialStatePropertyAll<Color>(MColors.white),
              ),
            ),
          );
        },
        itemCount: Constants.productCategories.length,
      ),
    );
  }
}
