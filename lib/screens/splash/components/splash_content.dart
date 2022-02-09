import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,  required this.text,required this.image,
  }) : super(key: key);

  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset('assets/images/gozeri_cyan.png',width: getProportionateScreenWidth(150))
        /*Text("Gozeri", 
              style:TextStyle(
                fontSize: getProportionateScreenWidth(36),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold
              )
        )*/,
        Text(text??"hola",textAlign: TextAlign.center,),
        const Spacer(flex: 2,),
        SvgPicture.asset(
          image??"assets/image/paypal.png",
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(210),
        )
        
      ],
    );
  }
}