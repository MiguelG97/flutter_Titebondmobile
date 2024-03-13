import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/auth/presenter/screens/register_screen.dart';
import 'package:mobile/modules/auth/presenter/widgets/Loggin_form.dart';

class Loggin_Screen extends StatefulWidget {
  const Loggin_Screen({super.key});

  @override
  State<Loggin_Screen> createState() => _Loggin_ScreenState();
}

class _Loggin_ScreenState extends State<Loggin_Screen> {
  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: SizedBox(
            height: sizeScreen.height * 0.98,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: sizeScreen.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hello Again!",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: Constants.spaceBtwItems / 3),
                      SizedBox(
                        width: sizeScreen.width / 2,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Fill your details Or continue with social media",
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                LogginForm(),

                //register as new user
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New User? ",
                              style: TextStyle(
                                color: MColors.dark_300,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                              },
                              child: Text(
                                "Create Account",
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff1A1D1E),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
