import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task1/Screens/home.dart';
import '../../shared/components/components.dart';

import '../../shared/resources/assets_manager.dart';
import '../../shared/resources/color_manager.dart';
import '../../shared/resources/strings_manager.dart';
import '../../shared/resources/values_manager.dart';
import '../register_Screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      ImageAssets.titleLoginImage,
                    ),
                    fit: BoxFit.fill)),
          ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              const Text('${AppStrings.welcomeToOurApp} '),
                              TextLogo(
                                textSize: 18,
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppStrings.signIn,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: ColorManager.black,
                                  ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: const [
                                Text(
                                  '${AppStrings.help} ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: ColorManager.primary),
                                ),
                                Icon(
                                  Icons.help,
                                  color: ColorManager.primary,
                                  size: 22,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s28,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.phoneNumber,
                            style: TextStyle(fontSize: 18),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      IntlPhoneField(
                        decoration: InputDecoration(
                          prefixIconColor: ColorManager.primary,
                          hintText: 'Eg: 01000000000',
                          iconColor: ColorManager.primary,
                          fillColor: ColorManager.primary,
                          hintStyle: TextStyle(color: ColorManager.primary),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorManager.primary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                        initialCountryCode: 'EG',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s28,
                      ),
                      DefaultButton(
                        height: 50,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            navigateAndFinish(context, const HomeScreen());
                          }
                        },
                        text: AppStrings.signIn,
                      ),
                      const SizedBox(
                        height: AppSize.s14,
                      ),
                      const Text(
                        AppStrings.or,
                        style:
                            TextStyle(fontSize: 18, color: ColorManager.grey),
                      ),
                      const SizedBox(
                        height: AppSize.s14,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: SignInButton(
                          Buttons.Google,
                          elevation: 0,
                          shape: Border.all(color: ColorManager.primary),
                          mini: false,
                          text: 'SignIn With Google',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s28,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '${AppStrings.donotHaveAnAccount} ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          DefaultTextButton(
                              function: () {
                                navigateAndFinish(context, RegisterScreen());
                              },
                              text: AppStrings.signUp)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
