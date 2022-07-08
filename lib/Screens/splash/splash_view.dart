import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components/components.dart';
import '../../shared/resources/color_manager.dart';
import '../../shared/resources/constants_manager.dart';
import '../on_boarding_screen/on_boarding_screen.dart';
// import '../../shared/components/components.dart';
// import '../../shared/resources/color_manager.dart';

// import '../../shared/resources/constants_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  //start delay
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

//Navigat to next screen
  _goNext() async {
    navigateAndFinish(context, OnBoardingScreen());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    //Screen Design
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLogo(),
          ],
        ),
      ),
    );
  }
}
