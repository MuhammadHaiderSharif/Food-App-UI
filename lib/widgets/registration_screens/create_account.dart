import 'package:flutter/material.dart';

import 'package:food_app/models/db_connection.dart';
import 'package:food_app/widgets/registration_screens/custom_button.dart';
import 'package:food_app/models/model_class.dart';
import 'package:food_app/models/custom_snack_bar.dart';
import 'package:food_app/widgets/registration_screens/custom_button_icon.dart';
import 'package:food_app/widgets/registration_screens/custom_textfield.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  void getValues(String title, String value) async {
    if (title == 'Full Name') {
      name = value;
    } else if (title == 'Email address') {
      email = value;
    } else if (title == 'Password') {
      password = value;
    }

    if (name != "" && email != "" && password != "") {
      setState(() {
        enable = true;
      });
    } else {
      setState(() {
        enable = false;
      });
    }
  }

  void requiredFunction() async {
    DbConnection(showSnackBar: showSnackBar).register(name, email, password);
  }

  void showSnackBar() async {
    exist == true
        ? ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.snackBar1)
        : ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.snackBar2);
  }

  void checkVisibility() async {
    setState(() {
      if (obscureText == true) {
        obscureText = false;
      } else {
        obscureText = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    createAccount = true;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 36,
          ),
          CustomTextField(
            titleText: 'Full Name',
            hintText: 'Enter your full name',
            getValues: getValues,
            padding: 16.0,
            obscureText: false,
          ),
          CustomTextField(
            titleText: 'Email address',
            hintText: 'Eg namaemail@emailkamu.com',
            getValues: getValues,
            padding: 16.0,
            obscureText: false,
          ),
          CustomTextField(
            keyboardType: TextInputType.visiblePassword,
            titleText: 'Password',
            hintText: '**** **** ****',
            getValues: getValues,
            padding: 16.0,
            obscureText: obscureText,
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xff32B768)),
              onPressed: () {
                checkVisibility();
              },
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          CustomButton(
            title: 'Registration',
            backgroundColor:
                enable ? const Color(0xff32B768) : const Color(0xffF4F4F4),
            foregroundColor:
                enable ? const Color(0xffFFFFFF) : const Color(0xff9CA3AF),
            requiredFunction: requiredFunction,
            enableButton: enable,
            // showSnackBar: showSnackBar,
          ),
          const Divider(
            thickness: 0.5,
            color: Color(0xffD2D4D8),
            height: 15,
            endIndent: 110,
            indent: 110,
          ),
          const CustomButtonIcon(
            title: 'Sign up with Google',
            backgroundColor: Color(0xffF4F4F4),
            foregroundColor: Color(0xff222222),
            iconImage: 'assets/images/Google.png',
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
