import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/presenter/cart/widgets/dashed_Line.dart';

class MCheckoutPrice extends StatelessWidget {
  const MCheckoutPrice({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 258,
      width: screenSize.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff707b81),
                ),
              ),
              Text(
                "\$753.95",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1a2530),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery",
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff707b81),
                ),
              ),
              Text(
                "\$60.20",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1a2530),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Constants.spaceBtwItems / 2,
          ),
          CustomPaint(
            size: Size(screenSize.width, 2),
            painter: DashedLinePainter(),
          ),
          SizedBox(
            height: Constants.spaceBtwItems / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Cost",
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: MColors.dark_100,
                ),
              ),
              Text(
                "\$814.15",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: MColors.bluePrimay,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Constants.spaceBtwItems,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MColors.bluePrimay,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text("Checkout"),
            ),
          )
        ],
      ),
    );
  }
}
