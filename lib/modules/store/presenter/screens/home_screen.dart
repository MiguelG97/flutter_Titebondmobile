import 'package:flutter/material.dart';
import 'package:mobile/modules/store/presenter/widgets/BottomNavBar.dart';

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
      backgroundColor: Color(0xffF7F7F9), //Color(0xffF7F7F9)
      body: CustomScrollView(shrinkWrap: true, slivers: [
        SliverAppBar(pinned: true, expandedHeight: 320),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            width: screenSize.width,
            height: screenSize.height,
            color: Color(0xffF7F7F9), //Color(0xffF7F7F9)
            child: Column(children: [Text("data")]),
          );
        }, childCount: 1))
      ]),
      bottomNavigationBar: MBottomNavigationBar(screenSize: screenSize),
    );
  }
}

// SingleChildScrollView(
        // child: Container(
        //   width: screenSize.width,
        //   height: screenSize.height,
        //   color: Color(0xffF7F7F9), //Color(0xffF7F7F9)
        //   child: Column(children: []),
        // ),
//       )
