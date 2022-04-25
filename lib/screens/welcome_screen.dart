import 'package:flutter/material.dart';
import 'package:project_chat_flash/screens/login_screen.dart';
import 'package:project_chat_flash/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:project_chat_flash/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                        'Chat Flash',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54
                      ),
                      speed: const Duration(milliseconds: 250),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 1000),
                  onTap: () {
                    // print("Tap Event");
                  },
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),

            RoundedButton(colour: Colors.lightBlueAccent, buttonText: 'Log In', onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);}),

            RoundedButton(colour: Colors.blueAccent,  buttonText: 'Register', onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },)

          ],
        ),
      ),
    );
  }
}

