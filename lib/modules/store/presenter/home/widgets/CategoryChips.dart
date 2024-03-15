import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';

class MCategoryChips extends StatefulWidget {
  const MCategoryChips({
    super.key,
  });

  @override
  State<MCategoryChips> createState() => _MCategoryChipsState();
}

class _MCategoryChipsState extends State<MCategoryChips> {
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
              onTap: () {
                setState(() {
                  Constants.productCategories[index].isActivate =
                      !Constants.productCategories[index].isActivate;
                  //apply filter by this category!
                  if (Constants.productCategories[index].isActivate) {}
                });
              },
              child: Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                label: SizedBox(
                    width: 100,
                    height: 40,
                    child: Center(
                        child: Text(
                      Constants.productCategories[index].text,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: MColors.dark_100),
                    ))),
                backgroundColor: Constants.productCategories[index].isActivate
                    ? MColors.primary
                    : MColors.white,
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
