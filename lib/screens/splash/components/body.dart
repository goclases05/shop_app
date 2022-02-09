// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/components/splash_content.dart';
import 'package:shop_app/size_config.dart';

import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int current_page=0;

  List<Map<String,String>> SplashData=[
    {
      "text":"¡Bienvenido a Gozeri Market, compremos!",
      "image": "assets/img/splash_1.svg"
    },
    {
      "text":"Ayudamos a las personas a conectarse con la tienda \nalrededor de Guatemala",
      "image": "assets/img/splash_2.svg"
    },
    {
      "text":"Te mostramos la manera fácil de comprar. \nQuédate en casa con nosotros",
      "image": "assets/img/splash_3.svg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                  onPageChanged: (value){
                    setState(() {
                      current_page=value;
                    });
                  },
                  itemCount: SplashData.length,
                  itemBuilder: (context,int index) => SplashContent(
                  text: SplashData[index]["text"],
                  image: SplashData[index]["image"]
                )
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children:[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: 
                        List.generate(SplashData.length, (index) => buildDot(index: index))
                      ,
                    ),
                    Spacer(flex: 3,),
                    DefaultButton(text: 'Continuar',press: (){
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    }),
                    Spacer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: current_page==index ?20:6,
      decoration: BoxDecoration(color:current_page==index? kPrimaryColor:Color(0xFFD8D8D8),borderRadius: BorderRadius.circular(3)),
      
    );
  }
}




