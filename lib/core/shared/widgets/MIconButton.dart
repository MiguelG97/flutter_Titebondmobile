import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MIconButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final Color iconColor;
  final Color activeIconColor;
  final Color bgColor;
  final VoidCallback iconCallBack;
  const MIconButton(
      {super.key,
      required this.icon,
      required this.iconCallBack,
      this.iconColor = const Color(0xff707B81),
      this.activeIconColor = const Color(0xff0D6EFD),
      this.bgColor = const Color(0xffffffff),
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        onPressed: iconCallBack,
        icon: Icon(icon, color: isActive ? activeIconColor : iconColor),
      ),
    );
  }
}
