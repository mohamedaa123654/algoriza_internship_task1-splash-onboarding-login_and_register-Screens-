import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class DefaultButton extends StatelessWidget {
  VoidCallback? onPressed;
  String text;
  double? width;
  double? height;
  double radius;
  bool isUpperCase;
  Color? buttonColor;
  Color? textColor;

  DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.width = double.infinity,
      this.height,
      this.radius = 3.0,
      this.isUpperCase = false,
      this.buttonColor = ColorManager.primaryButtonColor,
      this.textColor = ColorManager.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: buttonColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class TextLogo extends StatelessWidget {
  double textSize;
  TextLogo({Key? key, this.textSize = 32}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '7',
          style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: ColorManager.sevencolor),
        ),
        Text(
          'Krave',
          style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary),
        )
      ],
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  VoidCallback? function;
  String text;
  DefaultTextButton({Key? key, required this.function, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: ColorManager.primary),
      ),
    );
  }
}

class DefaultFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  ValueChanged<String>? onSubmit;
  ValueChanged<String>? onChange;
  VoidCallback? onTap;
  bool isPassword;
  FormFieldValidator<String> validate;
  String? label;
  String? hintText;
  IconData prefix;
  IconData? suffix;
  VoidCallback? suffixPressed;
  bool isClickable;

  DefaultFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.hintText,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    required this.validate,
    this.label,
    required this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        cursorColor: ColorManager.primary,
        style: TextStyle(color: ColorManager.primary),
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            hintStyle: const TextStyle(color: ColorManager.primary),
            fillColor: ColorManager.primary,
            focusColor: ColorManager.primary,
            labelStyle: const TextStyle(color: ColorManager.primary),
            prefixIcon: Icon(
              prefix,
              color: ColorManager.primary,
            ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: Icon(
                      suffix,
                      color: ColorManager.primary,
                    ),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: ColorManager.primary,
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.primary,
                  width: 5.0,
                ),
                borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

// void showToast({
//   required String text,
//   required ToastStates state,
// }) =>
//     Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: chooseToastColor(state),
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );

// enum
