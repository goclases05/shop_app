import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../screens/forgot_password/forgot_password_screen.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",style: TextStyle(fontSize: getProportionateScreenWidth(16)),),
        GestureDetector(
          onTap: (){

          },
          child: Text("Sing Up",style: TextStyle(fontSize: getProportionateScreenWidth(16),color: kPrimaryColor),)
        )
      ],
    );
  }
}