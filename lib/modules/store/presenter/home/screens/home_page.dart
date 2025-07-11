import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/data/models/product.dart';
import 'package:mobile/modules/store/data/models/sku.dart';
import 'package:mobile/modules/store/data/services/titebond_services.dart';
import 'package:mobile/modules/store/presenter/cart/screens/cart_screen.dart';
import 'package:mobile/modules/store/presenter/home/widgets/CategoryChips.dart';
import 'package:mobile/modules/store/presenter/home/widgets/MCarousel.dart';
import 'package:mobile/modules/store/presenter/home/widgets/ProductCard.dart';
import 'package:mobile/modules/store/presenter/home/widgets/SearchBar.dart';
import 'package:mobile/modules/store/presenter/product/screen/product_screen.dart';

class MHomePage extends StatefulWidget {
  const MHomePage({super.key});

  @override
  State<MHomePage> createState() => _MHomePageState();
}

class _MHomePageState extends State<MHomePage> {
  late Future<dynamic> _data;
  @override
  void initState() {
    super.initState();
    _data = TitebondapiService.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          // snap: true,
          // stretch: true,
          // clipBehavior: Clip.none,
          primary: true,
          floating: false,
          collapsedHeight: 80,
          toolbarHeight: 80,
          backgroundColor: MColors.secondary_100,
          pinned: true,
          expandedHeight: 438,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Symbols.menu,
              size: 25,
              color: MColors.dark_100,
            ),
          ),
          centerTitle: true,
          title: Image.asset("assets/logo/TITEBOND-02-gkl.png",
              height: 80, fit: BoxFit.contain),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Center(
                child: Container(
                  height: 44, //not working!
                  width: 44,
                  decoration: BoxDecoration(
                      color: MColors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CartScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.shopping_bag,
                        fill: 1,
                        color: MColors.dark_100,
                      )),
                ),
              ),
            )
          ],
          flexibleSpace: FlexibleSpaceBar.createSettings(
            // minExtent: 0,
            // maxExtent: 230,
            toolbarOpacity: 1,
            currentExtent: 0,
            child: FlexibleSpaceBar(
              titlePadding: const EdgeInsetsDirectional.only(
                bottom: 20,
                top: 80,
              ),

              ///search bar + carousel
              title: SizedBox(
                width: screenSize.width,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Constants.spaceBtwItems / 4,
                        ),
                        //1) search bar
                        MSearchBar(screenSize: screenSize),

                        SizedBox(
                          height: Constants.spaceBtwItems / 1.5,
                        ),

                        //2) carousel (List.PageView!)
                        MCarousel(),
                      ]),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ),
            width: screenSize.width,
            // height: screenSize.height,
            color: MColors.secondary_100, //Color(0xffF7F7F9)
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Select Category",
                style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MColors.dark_100),
              ),
              SizedBox(height: Constants.spaceBtwItems / 2),
              const MCategoryChips(),
              SizedBox(height: Constants.spaceBtwItems),
            ]),
          ),
        ),
        FutureBuilder(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                ///...
                return SliverToBoxAdapter(
                  child: Text(snapshot.error.toString()),
                );
              }
              List<Product> products = List<Product>.from(snapshot.data);
              Map<Product, List<SKU>> mapSKU = {};
              List<SKU> skus = [];
              for (Product item in products) {
                mapSKU[item] = item.skus;
                skus.addAll(item.skus);
              }

              return SliverGrid.builder(
                itemCount: skus.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 201,
                  crossAxisSpacing: Constants.spaceBtwItems / 8,
                  mainAxisSpacing: Constants.spaceBtwItems,
                ),
                itemBuilder: (context, index) {
                  SKU sku = skus[index];
                  late Product productFound;
                  mapSKU.forEach(
                    (key, value) {
                      try {
                        SKU skufound = value.firstWhere((element) =>
                            element.stripe_price_id == sku.stripe_price_id);
                        productFound = key;
                      } catch (e) {
                        print(e);
                      }
                    },
                  );

                  return GestureDetector(
                    onTap: () {
                      // print("next page for a product");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductScreen(
                              sku: sku,
                              product: productFound,
                              imageMemory: sku.imageData.asUint8List(),
                            );
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: MProductCard(
                          sku: sku,
                          imageBytes: sku.imageData.asUint8List(),
                          product: productFound),
                    ),
                  );
                },
              );
            } else {
              return const SliverToBoxAdapter(
                  //try with skeletons!!
                  child: Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ],
    );
  }
}
