import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mobile/core/shared/constants/constants.dart';
import 'package:mobile/core/shared/widgets/MAppbarNav.dart';
import 'package:mobile/core/theme/colors.dart';
import 'package:mobile/modules/store/presenter/home/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MAppBarNav(
        toolbarHeight: 80,
        title: "",
        leadingBackgroundColor: MColors.secondary_100,
      ),
      body: SafeArea(
        child: SizedBox(
          height: sizeScreen.height * 0.96 - 80,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: SizedBox(
              height: sizeScreen.height * 0.96 - 80,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Register Account",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: Constants.spaceBtwItems / 3),
                        SizedBox(
                          child: Text(
                            textAlign: TextAlign.center,
                            "Fill your details Or continue with \n social media",
                            style: Theme.of(context).textTheme.titleSmall,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: Constants.spaceBtwItems,
                  ),

                  ///form
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //1) name
                        Text(
                          "Your Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: MColors.dark_100,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          controller: namecontroller,
                          validator:
                              // The validator receives the text that the user has entered.
                              (value) {
                            if (value == null || value.isEmpty) {
                              return "Name must not be empty";
                            }
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.poppins(
                              color: const Color(0xff6A6A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            hintText: "titebond",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14)),
                            filled: true,
                            fillColor: MColors.secondary_100,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Constants.spaceBtwItems,
                        ),
                        //2) name
                        Text(
                          "Email Address",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: MColors.dark_100,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          controller: emailcontroller,
                          validator:
                              // The validator receives the text that the user has entered.
                              (value) {
                            if (value == null || value.isEmpty) {
                              return "Email must not be empty";
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.poppins(
                              color: const Color(0xff6A6A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            hintText: "xyz@gmail.com",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14)),
                            filled: true,
                            fillColor: MColors.secondary_100,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Constants.spaceBtwItems,
                        ),
                        //3) password
                        Text(
                          "Password",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: MColors.dark_100,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          controller: passwordcontroller,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true, //for password!
                          decoration: InputDecoration(
                            suffixIconColor: MColors.dark_300,
                            suffixIcon: Icon(Symbols.visibility_off),
                            hintStyle: GoogleFonts.poppins(
                              color: MColors.dark_300,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            hintText: "•••••••••",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14)),
                            filled: true,
                            fillColor: MColors.secondary_100,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password must not be empty";
                            } else if (value.length < 6) {
                              return "Password length must be at least 6 characters";
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: Constants.spaceBtwItems,
                        ),

                        //4) loggin buttons
                        SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                try {
                                  // UserCredential credential = await FirebaseAuth
                                  //     .instance
                                  //     .createUserWithEmailAndPassword(
                                  //         email: emailcontroller.text,
                                  //         password: passwordcontroller.text);
                                  // //no need for signin since it's automatically signed in if user is created successfully
                                  // await credential.user!
                                  //     .updateDisplayName(namecontroller.text);

                                  ///show a dialog for email confirmation!
                                  // ignore: use_build_context_synchronously
                                  // showDialog(
                                  //   builder: (context) => AlertDialog(
                                  //     title:
                                  //         Text("Account Successfully Created"),
                                  //     content: Text(
                                  //         "Please check your email to verify your account"),
                                  //     actions: [
                                  //       TextButton(
                                  //         onPressed: () {
                                  //           // ignore: use_build_context_synchronously
                                  //           Navigator.of(context)
                                  //               .pushReplacement(
                                  //             MaterialPageRoute(
                                  //               builder: (context) =>
                                  //                   const HomeScreen(),
                                  //             ),
                                  //           );
                                  //         },
                                  //         child: Text("Continue"),
                                  //       )
                                  //     ],
                                  //   ),
                                  //   context: context,
                                  // );

                                  showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (context) => BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 6, sigmaY: 6),
                                      child: AlertDialog(
                                        contentPadding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 20,
                                            top: 20),
                                        alignment: Alignment.center,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        title: Center(
                                          child: Container(
                                            width: 44,
                                            height: 44,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                                color: MColors.primary),
                                            child: const Icon(
                                              Symbols.email,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        content: SizedBox(
                                          height: 140,
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Account Successfully Created",
                                                  style: GoogleFonts.raleway(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: MColors.dark_100),
                                                ),
                                                SizedBox(
                                                    height: Constants
                                                            .spaceBtwItems /
                                                        4),
                                                Text(
                                                  textAlign: TextAlign.center,
                                                  "Please check your email to verify your account",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xff707B81)),
                                                ),
                                                SizedBox(
                                                    height: Constants
                                                            .spaceBtwItems /
                                                        2),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 20,
                                                  ),
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      backgroundColor:
                                                          MColors.primary,
                                                    ),
                                                    onPressed: () {
                                                      // ignore: use_build_context_synchronously
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const HomeScreen(),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      "Continue",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: MColors
                                                                  .dark_200),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).then(
                                    (value) =>
                                        Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                    ),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    print(
                                        'The account already exists for that email.');
                                  }
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
                                "Sign Up",
                                style: GoogleFonts.raleway(
                                    color: MColors.titleLarge,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                        SizedBox(
                          height: Constants.spaceBtwItems / 3,
                        ),
                        //google auth
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
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
                                Image.asset("assets/images/google-logo.png"),
                                Text(
                                  "Sign Up With Google",
                                  style: GoogleFonts.raleway(
                                      color: MColors.titleLarge,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: Constants.spaceBtwItems,
                        // ),
                      ],
                    ),
                  ),
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
                                "Already Have Account? ",
                                style: TextStyle(
                                  color: MColors.dark_300,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const Loggin_Screen(),
                                  //   ),
                                  // );
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Log In",
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
      ),
    );
  }
}
