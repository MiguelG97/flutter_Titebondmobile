import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';

class MItemCart extends StatelessWidget {
  const MItemCart({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key("dismiss1"),
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            width: screenSize.width * 0.25 - 20,
            height: 140,
            decoration: BoxDecoration(
              color: MColors.bluePrimay,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Symbols.add,
                    color: MColors.white,
                    weight: 700,
                  ),
                ),
                Text(
                  "1",
                  style: GoogleFonts.raleway(
                      fontSize: 16,
                      color: MColors.white,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Symbols.remove,
                    color: MColors.white,
                    weight: 700,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      endActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () {},
        ),
        dragDismissible: true,
        extentRatio: 0.30,
        motion: const ScrollMotion(),
        children: [
          const Expanded(
            flex: 1,
            child: Text(""),
          ),
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.center,
              width: screenSize.width * 0.25 - 10,
              decoration: BoxDecoration(
                color: const Color(0xffFF1900),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Symbols.delete,
                  color: MColors.white,
                  weight: 700,
                ),
              ),
            ),
          )
          // SlidableAction(
          //   flex: 1,
          //   onPressed: (context) {},
          //   padding: EdgeInsets.symmetric(horizontal: 5),
          //   icon: Icons.abc,
          //   foregroundColor: MColors.white,
          //   backgroundColor: Colors.transparent,
          // ),
          // SlidableAction(
          //   flex: 10,
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 20),
          //   backgroundColor: const Color(0xffFF1900),
          //   onPressed: (context) {},
          //   icon: Symbols.delete,
          //   borderRadius: BorderRadius.circular(8),
          // ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 140,
        child: Row(
          children: [
            Image.network(
              "http://imagecenter.titebond.com/Woodworking/TBOriginal/TB%20Original%2032oz.jpg",
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: Constants.spaceBtwItems / 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Titebond Premiun",
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff1A2530),
                  ),
                ),
                SizedBox(
                  height: Constants.spaceBtwItems / 2,
                ),
                Text(
                  "\$94.05",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff1A2530),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
