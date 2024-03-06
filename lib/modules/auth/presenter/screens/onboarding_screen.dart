import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/modules/auth/presenter/controllers/onboard_bloc.dart';
import 'package:mobile/modules/auth/presenter/controllers/onboard_events.dart';
import 'package:mobile/modules/auth/presenter/controllers/onboard_states.dart';
import 'package:mobile/modules/auth/presenter/widgets/CustomClipper_Onboard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    MCustomClipper.sizeScreen = sizeScreen;

    return BlocProvider<OnboardingBloc>(
      lazy: false,
      create: (_) => OnboardingBloc(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        // bloc: OnboardingBloc(),
        builder: (context, state) {
          OnboardingCurrentState currentState = state as OnboardingCurrentState;
          OnboardingBloc bloc = context.read<OnboardingBloc>();
          print(currentState.currentPageIndex);

          return Scaffold(
            body: Column(
              children: [
                ClipPath(
                  child: Container(
                    width: sizeScreen.width,
                    height: sizeScreen.height / 1.8,
                    child: PageView.builder(
                      onPageChanged: (index) {
                        bloc.add(OnboardpageHasChanged(pageIndex: index));
                      },
                      controller: controller,
                      itemBuilder: (context, index) {
                        return Container(
                          // color: Colors.red,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    Constants.onboardingPictures[index]),
                                fit: BoxFit.cover,
                                alignment: Alignment.center),
                          ),
                        );
                      },
                      itemCount: Constants.onboardingPictures.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  clipper: MCustomClipper(),
                ),

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 40, bottom: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //texts
                        Column(children: [
                          Text(
                            Constants.onboardingTitles[
                                currentState.currentPageIndex],
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff404040)),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Search and filter products from the best glue wood supplier to find the matching one for your business",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff757575)),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                        SmoothPageIndicator(
                          controller: controller,
                          onDotClicked: (index) {},
                          count: Constants.onboardingPictures.length,
                          effect: ScrollingDotsEffect(
                              dotColor: Color(0xffe0e0e0),
                              activeDotColor: Color(0xffffcc06)),
                        ),
                        SizedBox(
                          width: sizeScreen.width,
                          child: FilledButton(
                            onPressed: () {
                              if (currentState.currentPageIndex ==
                                  Constants.onboardingTitles.length - 1) return;
                              bloc.add(OnboardpageHasChanged(
                                  pageIndex:
                                      currentState.currentPageIndex + 1));
                              // controller.jumpToPage(
                              //     currentState.currentPageIndex + 1);
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Color(0xffffcc06),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //page navigation
              ],
            ),
          );
        },
      ),
    );
  }
}
