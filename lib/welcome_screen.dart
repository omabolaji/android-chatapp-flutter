import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'material_log_btn.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
//  Animation animation2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    animation = ColorTween(
      begin: Colors.blueGrey.shade900,
      end: Colors.white,
    ).animate(controller);
//    animation2 = CurvedAnimation(
//      parent: controller,
//      curve: Curves.decelerate,
//    );

    controller.forward();

//    animation2.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        controller.reverse(from: 1.0);
//      } else if (status == AnimationStatus.dismissed) {
//        controller.forward();
//      }
//    });

    controller.addListener(() {
      setState(() {});
//      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 60.0,
                      child: Icon(
                        Icons.flash_on,
                        size: 50,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            MaterialLogBtn(
              colour: Colors.lightBlueAccent,
              labelText: Text('Login'),
              onpressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            MaterialLogBtn(
              colour: Colors.blue,
              labelText: Text('Register'),
              onpressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
