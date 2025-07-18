import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MCarousel extends StatelessWidget {
  MCarousel({super.key});

  final List<Widget> carouselScreens = [
    const CarouselScreen1(),
    const CarouselScreen1(),
  ];
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                return carouselScreens[index];
              },
              itemCount: carouselScreens.length),
        ),
        SizedBox(height: Constants.spaceBtwItems / 2),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: SmoothPageIndicator(
              controller: pageController,
              effect: ScrollingDotsEffect(
                  dotWidth: 12,
                  dotHeight: 12,
                  activeDotColor: MColors.primary,
                  dotColor: const Color(0xffE0E0E0)),
              count: carouselScreens.length,
            ),
          ),
        )
      ],
    );
  }
}

class CarouselScreen1 extends StatelessWidget {
  const CarouselScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 220,
        child: Image.asset(
          "assets/images/log-trunks-pile-sawn.jpg",
          fit: BoxFit.cover,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [MColors.primary, Colors.transparent],
              begin: Alignment.centerLeft,
              stops: [0.2, 1],
              end: Alignment.centerRight),
        ),
        height: 220,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Explore new \narrivals with us!",
            maxLines: 2,
            style: GoogleFonts.manrope(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: MColors.dark_100),
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
                color: MColors.dark_100),
          ),
          SizedBox(
            height: Constants.spaceBtwItems / 2,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: MColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42))),
              onPressed: () {},
              child: Text(
                "Shop now",
                style: TextStyle(color: MColors.dark_100),
              ))
        ]),
      ),
    ]);
  }
}
