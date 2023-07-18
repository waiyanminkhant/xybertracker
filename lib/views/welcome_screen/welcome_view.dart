import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xybertracker/auth/auth_error.dart';
import 'package:xybertracker/views/login_screen/login_view.dart';
import 'package:xybertracker/views/register_screen/email_view.dart';

class welcomeView extends StatelessWidget {
  const welcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('lib/assets/splash_logo.json',
                  width: 300, fit: BoxFit.fill, reverse: true),
              const Text(
                '420 Expense Tracker',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'A tracker for individual expenses be available \nin a different version',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.shade500, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: EmailView(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: Duration(microseconds: 250)));
                    },
                    color: Colors.cyan,
                    child: const Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: LoginView(), type: PageTransitionType.fade));
                  },
                  child: const Text(
                    'I Already have an account ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: authErrorRegister != ''
                    ? Text(authErrorRegister.split(']')[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold))
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
