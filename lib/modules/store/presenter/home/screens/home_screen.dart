import 'package:flutter/material.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/presenter/home/screens/home_page.dart';
import 'package:mobile/modules/store/presenter/home/widgets/BottomNavBar.dart';

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
        child: MHomePage(screenSize: screenSize),
      ),
      bottomNavigationBar: MBottomNavigationBar(screenSize: screenSize),
    );
  }
}
