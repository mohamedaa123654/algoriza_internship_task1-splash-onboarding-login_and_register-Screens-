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
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

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








// import 'dart:async';
// import 'package:flutter/material.dart';

// import '../../shared/resources/constants_manager.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);

//   @override
//   _SplashViewState createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   Timer? _timer;
//   // final AppPreferences _appPreferences = instance<AppPreferences>();

//   _startDelay() {
//     _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
//   }

//   _goNext() async {
//     // _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
//     //       if (isUserLoggedIn)
//     //         {
//     //           // navigate to main screen
//     //           Navigator.pushReplacementNamed(context, Routes.mainRoute)
//     //         }
//     //       else
//     //         {
//     //           _appPreferences
//     //               .isOnBoardingScreenViewed()
//     //               .then((isOnBoardingScreenViewed) => {
//     //                     if (isOnBoardingScreenViewed)
//     //                       {
//     //                         // navigate to login screen

//     //                         Navigator.pushReplacementNamed(
//     //                             context, Routes.loginRoute)
//     //                       }
//     //                     else
//     //                       {
//     //                         // navigate to onboarding screen

//     //                         Navigator.pushReplacementNamed(
//     //                             context, Routes.onBoardingRoute)
//     //                       }
//     //                   })
//     //         }
//     //     });
  
//   }

//   @override
//   void initState() {
//     super.initState();
//     _startDelay();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.primary,
//       body:
//           const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
//     );
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
// }
