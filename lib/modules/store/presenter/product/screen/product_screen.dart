import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/shared/widgets/MAppbarNav.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/presenter/product/widgets/BottomNavBar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  final double toolbarHeight = 80;
  final double bottombarHeight = 100;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MColors.secondary_100,
      appBar: MAppBarNav(
        toolbarHeight: toolbarHeight,
        title: "Product Name",
        showBag: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            //1) content
            Expanded(
                child: SizedBox(
              width: screenSize.width,
              // color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                        height: 260,
                        fit: BoxFit.contain,
                        "http://imagecenter.titebond.com/Woodworking/TBOriginal/TB%20Original%2032oz.jpg"),
                    SizedBox(
                      height: Constants.spaceBtwItems,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: MColors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 42,
                              offset: Offset(0, 8),
                              color: Colors.black.withOpacity(0.1),
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //a) headers
                          Text(
                            "TITEBOND",
                            style: GoogleFonts.manrope(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: MColors.dark_200),
                          ),
                          Row(
                            children: [
                              Text(
                                "\$230.00",
                                style: GoogleFonts.manrope(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                    color: MColors.dark_200),
                              ),
                              SizedBox(
                                width: Constants.spaceBtwItems / 2,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: const BoxDecoration(
                                  color: Color(0xff40c851),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(6),
                                    topLeft: Radius.circular(6),
                                  ),
                                ),
                                child: Text(
                                  "In Stock",
                                  style: GoogleFonts.manrope(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: MColors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Symbols.star,
                                fill: 1,
                                color: MColors.primary,
                              ),
                              Text(
                                "4.9 (256)",
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  color: MColors.dark_200,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: Constants.spaceBtwItems / 2),
                          //b) product presentation
                          Text(
                            "A minimalist glue product wthat provides the best joints to your wood products.",
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              color: MColors.dark_200,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: Constants.spaceBtwItems / 2),
                          //c) product description collapsable
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Product Description",
                                style: GoogleFonts.manrope(
                                  fontSize: 18,
                                  color: MColors.dark_200,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Symbols.expand_less,
                                  color: MColors.dark_200,
                                  weight: 700,
                                  size: 32,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "Choose a stylish dark color or brighten up your home with colorful sarongs. The EKERÖ armchair has a sleek and modern look with two sides that meet at the back – and a waist support for added comfort!",
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: MColors.dark_200,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: Constants.spaceBtwItems / 2),
                          //d) product specification collapsable
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Product Specifications",
                                style: GoogleFonts.manrope(
                                  fontSize: 18,
                                  color: MColors.dark_200,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Symbols.expand_less,
                                  color: MColors.dark_200,
                                  weight: 700,
                                  size: 32,
                                ),
                              )
                            ],
                          ),
                          Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            border: TableBorder.all(
                              color: Color(0xffe0e7e9),
                            ),
                            columnWidths: const {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                            },
                            children: [
                              for (int i = 0; i < 5; i++)
                                TableRow(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 14),
                                      alignment: Alignment.centerLeft,
                                      height: 30,
                                      color: const Color(0xffe0e7e9),
                                      child: Text("Fuerza"),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 14),
                                      child: Text("3,875 psi"),
                                    )
                                  ],
                                ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),

            //2) Bottom app bar
            MBottomNavBar(bottombarHeight: bottombarHeight)
          ],
        ),
      ),
    );
  }
}
