import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task1/Screens/home.dart';
import 'package:task1/Screens/login_screen/login_screen.dart';
import 'package:task1/shared/resources/strings_manager.dart';
import '../../shared/components/components.dart';
import '../../shared/resources/assets_manager.dart';
import '../../shared/resources/color_manager.dart';
import '../../shared/resources/values_manager.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          leading: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: ColorManager.black,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: IconButton(
                    color: ColorManager.black,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: ColorManager.white,
                      ),
                    ),
                    onPressed: () {
                      navigateAndFinish(context, LoginScreen());
                    },
                  ),
                ),
              )),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text('${AppStrings.welcomeToOurApp} '),
                              TextLogo(
                                textSize: 18,
                              )
                            ],
                          )),
                      SizedBox(
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
                            AppStrings.emailHint,
                            style: TextStyle(fontSize: 18),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        hintText: 'Eg: example@email.com',
                        prefix: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 15.0,
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
                      SizedBox(
                        // height: 60,
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            prefixIconColor: ColorManager.primary,
                            hintText: 'Eg: 01000000000',
                            iconColor: ColorManager.primary,
                            fillColor: ColorManager.primary,
                            hintStyle: TextStyle(color: ColorManager.primary),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorManager.primary),
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
                      ),
                      const SizedBox(
                        height: AppSize.s14,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.password,
                            style: TextStyle(fontSize: 18),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: suffix,
                        onSubmit: (value) {},
                        isPassword: isPassword,
                        suffixPressed: () {
                          changePasswordVisibility();
                        },
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'password is too short';
                          }
                        },
                        hintText: 'Password',
                        prefix: Icons.lock_outline,
                      ),
                      const SizedBox(
                        height: AppSize.s28,
                      ),
                      DefaultButton(
                        height: 60,
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
                      Text(
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
                            // border: Border.all(color: ColorManager.primary),
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
                                navigateAndFinish(context, LoginScreen());
                              },
                              text: AppStrings.signIn)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData suffix = Icons.visibility_outlined;

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    setState(() {});
  }
}
