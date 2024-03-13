import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/presenter/cart/screens/cart_screen.dart';

class MAppBarNav extends StatelessWidget implements PreferredSize {
  const MAppBarNav(
      {super.key,
      required this.toolbarHeight,
      required this.title,
      this.showBag = false,
      this.leadingBackgroundColor});
  final bool showBag;
  final double toolbarHeight;
  final String title;
  final Color? leadingBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: toolbarHeight,
      backgroundColor: Colors.transparent,
      leadingWidth: 80,
      leading: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 18, bottom: 18, right: 16),
        child: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: leadingBackgroundColor ?? MColors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Symbols.arrow_back_ios,
                  color: MColors.dark_100,
                  size: 14,
                  weight: 700,
                )),
          ),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      centerTitle: true,
      actions: [
        if (showBag)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Container(
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
                  Symbols.shopping_bag,
                  color: MColors.dark_100,
                  size: 24,
                ),
              ),
            ),
          )
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => this;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 80);
}
