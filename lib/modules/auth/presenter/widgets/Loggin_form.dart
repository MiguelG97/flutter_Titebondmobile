import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/presenter/home/screens/home_screen.dart';

class LogginForm extends StatelessWidget {
  LogginForm({
    super.key,
  });

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return Form(
        // key: _formKey,
        child: Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //1) email
            Text(
              "Email Address",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff2B2B2B),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.poppins(
                  color: Color(0xff6A6A6A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                hintText: "xyz@gmail.com",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(14)),
                filled: true,
                fillColor: Color(0xFFF7F7F9),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            SizedBox(
              height: Constants.spaceBtwItems,
            ),

            //2) password
            Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff2B2B2B),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true, //for password!
              decoration: InputDecoration(
                suffixIcon: Icon(Symbols.visibility_off),
                hintStyle: GoogleFonts.poppins(
                  color: Color(0xff6A6A6A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                hintText: "•••••••••",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(14)),
                filled: true,
                fillColor: Color(0xFFF7F7F9),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              validator: (value) {},
            ),

            //3) recovery password
            SizedBox(
              height: Constants.spaceBtwItems / 2,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Recovery password",
                textAlign: TextAlign.end,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Color(0xff707B81),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: Constants.spaceBtwItems,
            ),

            // //4) loggin buttons
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      UserCredential userCred = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passController.text);
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: MColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.raleway(
                        color: MColors.titleLarge,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            SizedBox(
              height: Constants.spaceBtwSections / 1.2,
            ),

            // //OR separator
            SizedBox(
              width: sizeScreen.width,
              height: 1,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xffC2C2C2), width: 1),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -7,
                    left: sizeScreen.width / 2.5,
                    child: Container(
                      color: Colors.white,
                      width: 50,
                      child: const Text(
                        "OR",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xff404040)),
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: Constants.spaceBtwSections / 1.2,
            ),

            //google auth
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google-logo.png"),
                      Text(
                        "Sign in With Google",
                        style: GoogleFonts.raleway(
                            color: MColors.titleLarge,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: MColors.secondary_100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                )),
            SizedBox(
              height: Constants.spaceBtwItems / 2,
            ),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const HomeScreen();
                      },
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: MColors.secondary_100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Continue as a Guest",
                        style: GoogleFonts.raleway(
                            color: MColors.titleLarge,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ],
    ));
  }
}
