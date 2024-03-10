import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/theme/colors.dart';

class MSearchBar extends StatelessWidget {
  const MSearchBar({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //a) seach bar
        Container(
          padding: const EdgeInsets.only(left: 20),
          width: screenSize.width * 0.8,
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.04),
                  offset: const Offset(0, 4),
                  spreadRadius: 0)
            ]),
            child: TextField(
              decoration: InputDecoration(
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: MColors.dark_300),
                  fillColor: MColors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none),
                  hintText: "Looking for glue",
                  prefixIcon: Icon(Symbols.search, color: MColors.dark_300),
                  prefixIconConstraints: BoxConstraints(minWidth: 50)),
            ),
          ),
        ),

        //b) filter icon
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
                color: MColors.primary,
                borderRadius: BorderRadius.circular(26)),
            child: IconButton(onPressed: () {}, icon: Icon(Symbols.tune)),
          ),
        )
      ],
    );
  }
}
