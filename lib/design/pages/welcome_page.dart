import 'dart:async';
import 'package:banking_app/design/pages/home_page.dart';
import 'package:flutter/material.dart';

List<String> _textList = [
  "Your next generation banking",
  "Banking made easy",
  "Secure and convenient banking",
  "Your empowered financial future",
  "Our banking app"
];

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  String _welcomeText = _textList[0];

  void displayNextText() {
    final int currentIndex = _textList.indexOf(_welcomeText);
    final int nextIndex = (currentIndex + 1) % _textList.length;
    _welcomeText = _textList[nextIndex];
  }

  @override
  void initState() {
    super.initState();

    // this code runs after every 2 seconds. 
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        displayNextText();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('lib/design/assets/welcome_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 450),
                    transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Text(
                        _welcomeText,
                        key: ValueKey<String>(_welcomeText),
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.blueAccent),
                        textAlign: TextAlign.center,
                      ),
                    )
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(40, 50)),
                      elevation: MaterialStatePropertyAll(5),
                      textStyle: MaterialStatePropertyAll(Theme.of(context).textTheme.titleSmall),
                      backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    child: Text('Get started'),
                  ),
                ]
              ),
            ],
          ),
        ),
      )
    );
  }
}