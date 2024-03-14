import 'package:flutter/material.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/presenter/home/screens/home_page.dart';
import 'package:mobile/modules/store/presenter/home/widgets/BottomNavBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("data")),
      backgroundColor: MColors.secondary_100, //Color(0xffF7F7F9)
      body: const SafeArea(
        child: MHomePage(),
      ),
      bottomNavigationBar: const MBottomNavigationBar(),
    );
  }
}
