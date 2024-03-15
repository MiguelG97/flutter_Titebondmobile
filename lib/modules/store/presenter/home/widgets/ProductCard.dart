import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/data/models/product.dart';
import 'package:mobile/modules/store/data/models/sku.dart';

class MProductCard extends StatelessWidget {
  const MProductCard(
      {super.key,
      required this.imageBytes,
      required this.product,
      required this.sku});
  final Uint8List imageBytes;
  final Product product;
  final SKU sku;
  @override
  Widget build(BuildContext context) {
    return Padding(
      //Margin
      padding: const EdgeInsets.only(left: 10, top: 14, right: 10),
      child: Container(
        // padding: const EdgeInsets.only(left: 0, right: 0),
        // width: 157,
        // height: 201,

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.04))
          ],
          color: MColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: 130,
                    height: 97,
                    child: Image(
                      fit: BoxFit.contain,
                      image: MemoryImage(imageBytes),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Titebond",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff1372fd)),
                      ),
                      SizedBox(
                        height: Constants.spaceBtwItems / 10,
                      ),
                      Text(
                        product.name
                            .toLowerCase()
                            .replaceFirst(" iii", " III")
                            .replaceFirst(" ii", " II")
                            .replaceFirst(" i", " I")
                            .replaceFirst("titebond ", ""),
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MColors.dark_300,
                        ),
                      ),
                      SizedBox(
                        height: Constants.spaceBtwItems / 4,
                      ),
                      Text(
                        "\$${sku.price / 100}",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: MColors.dark_100,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )
                ],
              ),

              ///Do not exit the boundaries or this nested gesture will have no effect!
              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    print("added to cart");
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: MColors.bluePrimay,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "+",
                        style: TextStyle(
                            color: MColors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
