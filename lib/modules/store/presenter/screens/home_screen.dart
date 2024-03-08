import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/presenter/widgets/BottomNavBar.dart';
import 'package:mobile/modules/store/presenter/widgets/SearchBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text("data")),
      backgroundColor: MColors.secondary_100, //Color(0xffF7F7F9)
      body: SafeArea(
        child: CustomScrollView(shrinkWrap: true, slivers: [
          SliverAppBar(
            // clipBehavior: Clip.none,
            primary: true,
            floating: false,
            collapsedHeight: 80,
            toolbarHeight: 80,
            backgroundColor: MColors.secondary_100,
            pinned: true,
            expandedHeight: 430,
            elevation: 0,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Symbols.menu,
                  size: 25,
                  color: MColors.iconDark,
                )),
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_bag,
                          fill: 1,
                          color: MColors.iconDark,
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
                titlePadding: EdgeInsetsDirectional.only(bottom: 20, top: 80),
                collapseMode: CollapseMode.pin,
                stretchModes: [StretchMode.blurBackground],
                title: SizedBox(
                  width: screenSize.width,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //1) search bar
                          MSearchBar(screenSize: screenSize),

                          SizedBox(
                            height: Constants.spaceBtwItems / 1.5,
                          ),

                          //2) carousel (List.PageView!)
                          SizedBox(
                            height: 220,
                            child: Stack(children: [
                              SizedBox(
                                height: 220,
                                child: Image.asset(
                                  "assets/images/log-trunks-pile-sawn.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 30),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        MColors.primary,
                                        Colors.transparent
                                      ],
                                      begin: Alignment.centerLeft,
                                      stops: [0.2, 1],
                                      end: Alignment.centerRight),
                                ),
                                height: 220,
                                width: screenSize.width,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Explore new \narrivals with us!",
                                        maxLines: 2,
                                        style: GoogleFonts.manrope(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700,
                                            color: MColors.iconDark),
                                      ),
                                      SizedBox(
                                        height: Constants.spaceBtwItems / 6,
                                      ),
                                      Text(
                                        "Get discounts up to 75% for \n glue wood products",
                                        maxLines: 2,
                                        style: GoogleFonts.manrope(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: MColors.iconDark),
                                      ),
                                      SizedBox(
                                        height: Constants.spaceBtwItems / 2,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: MColors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          42))),
                                          onPressed: () {},
                                          child: Text(
                                            "Shop now",
                                            style: TextStyle(
                                                color: MColors.iconDark),
                                          ))
                                    ]),
                              ),
                            ]),
                          ),
                          SizedBox(height: Constants.spaceBtwItems / 2),
                          //3) smooth page indicator
                          Container(
                              width: screenSize.width,
                              padding: EdgeInsets.only(
                                  left: screenSize.width / 2 - 15),
                              child: SmoothIndicator(
                                  effect: ScrollingDotsEffect(
                                      dotWidth: 12,
                                      dotHeight: 12,
                                      activeDotColor: MColors.primary,
                                      dotColor: Color(0xffE0E0E0)),
                                  offset: 0,
                                  count: 3,
                                  size: Size(0, 0))),
                          const SizedBox(
                            height: 10,
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: Constants.spaceBtwItems / 2,
          )),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: screenSize.width,
              height: screenSize.height,
              color: Color(0xffF7F7F9), //Color(0xffF7F7F9)
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Category",
                      style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MColors.iconDark),
                    ),
                    SizedBox(height: Constants.spaceBtwItems / 2),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Chip(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              label: SizedBox(
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
                              backgroundColor:
                                  index == 1 ? MColors.primary : MColors.white,
                              color: MaterialStatePropertyAll<Color>(
                                  MColors.white),
                            ),
                          );
                        },
                        itemCount: Constants.productCategories.length,
                      ),
                    ),
                    SizedBox(height: Constants.spaceBtwItems),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 201,
                            crossAxisSpacing: Constants.spaceBtwItems * 1,
                            mainAxisSpacing: Constants.spaceBtwItems),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            // width: 157,
                            // height: 201,
                            decoration: BoxDecoration(
                              color: MColors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Stack(clipBehavior: Clip.none, children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: double.infinity,
                                    height: 97,
                                    child: Image(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          "http://imagecenter.titebond.com/Woodworking/TBOriginal/TB%20Original%2032oz.jpg"),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Best Seller",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff1372fd)),
                                      ),
                                      SizedBox(
                                        height: Constants.spaceBtwItems / 10,
                                      ),
                                      Text(
                                        "Nike Jordan",
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: MColors.iconDark_100,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Constants.spaceBtwItems / 4,
                                      ),
                                      Text(
                                        "\$752.00",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: MColors.iconDark,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Positioned(
                                right: -20,
                                bottom: 0,
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
                              )
                            ]),
                          );
                        },
                      ),
                    )
                  ]),
            ),
          ),
          // SliverList(
          //     delegate: SliverChildBuilderDelegate((context, index) {
          //   return ;
          // }, childCount: 1))
        ]),
      ),
      bottomNavigationBar: MBottomNavigationBar(screenSize: screenSize),
    );
  }
}


// SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: 100,
//                   color: Colors.red,
//                 ),
//                 Container(
//                   height: 240,
//                   color: Colors.black,
//                 ),
//               ],
//             ),
//           ),
