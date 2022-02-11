import 'package:flutter/material.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_up/components/sign_up_form.dart';
import 'package:shop_app/size_config.dart';


class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: SizeConfig.screenHeight*0.02,),
              Text("Register Account",
                style: headingStyle,
              ),
              const Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
        
              ),
              SizedBox(height: SizeConfig.screenHeight*0.07,),
              const SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight*0.07,),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  SocalCard(icon: "assets/icons/google-icon.svg",press: (){},),
                  SocalCard(icon: "assets/icons/facebook-2.svg",press: (){},),
                  SocalCard(icon: "assets/icons/twitter.svg",press: (){},),
                ],
              ),
              SizedBox(height:getProportionateScreenHeight(20)),
              Text("By continuing your confirm that you agree \nwith our Term an Condition",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

