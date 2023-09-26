// import 'package:flutter/material.dart';

// class EmailView extends StatelessWidget {
//   const EmailView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0,
//         backgroundColor: Colors.white.withOpacity(0),
//       ),
//       body: Center(
//           child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 25, bottom: 25, top: 50),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [const Text("Enter Email Address")],
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xybertracker/bloc/app_bloc.dart';
import 'package:xybertracker/bloc/app_bloc.dart';
import 'package:xybertracker/controller/email_and_password_controller.dart';
import 'package:page_transition/page_transition.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  bool visiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25, top: 50),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Register account',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text(
                      'Enter E-mail and Password to create an account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.alternate_email,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: BlocBuilder<AppBloc, AppState>(
                        builder: (context, state) {
                          return TextField(
                            controller: emailController,
                            autofocus: true,
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown)),
                              hintText: 'email',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 25, top: 50),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const Text(
            //           'Insert a password',
            //           style: TextStyle(
            //             fontSize: 35,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         Text(
            //           'Insert a password to create your account',
            //           style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               color: Colors.grey.shade500),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.password,
                      color: Colors.grey.shade500,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: TextField(
                        controller: passwordController,
                        obscureText: visiblePassword,
                        autofocus: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visiblePassword = !visiblePassword;
                              });
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: visiblePassword
                                  ? Colors.grey.shade500
                                  : Colors.amber,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown)),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: state.isLoading
                        ? CircularProgressIndicator()
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: 250,
                              height: 50,
                              child: MaterialButton(
                                onPressed: () {
                                  context.read<AppBloc>().add(AppEventRegister(
                                      email: emailController.text,
                                      password: passwordController.text));
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                },
                                color: Colors.cyan,
                                child: Text('Create'),
                              ),
                            ),
                          ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
