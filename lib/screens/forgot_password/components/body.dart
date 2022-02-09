import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_icon_surffix.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error_file.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight*0.1,),
            Text("Recuperar Contraseña",
              style: TextStyle(fontSize: getProportionateScreenWidth(28),
                color: Colors.black,
                fontWeight: FontWeight.bold  
              ),
            ),
            const Text("Por favor ingrese su correo electrónico y le enviaremos un enlace para volver a su cuenta",
              textAlign: TextAlign.center
            ),
            SizedBox(height: SizeConfig.screenHeight*0.1,),
            const _ForgotPassFormState()
          ],
        ),
      ),
    );
  }
}

class _ForgotPassFormState extends StatefulWidget {
  const _ForgotPassFormState({ Key? key }) : super(key: key);

  @override
  __ForgotPassFormStateState createState() => __ForgotPassFormStateState();
}

class __ForgotPassFormStateState extends State<_ForgotPassFormState> {
  List<String> errors=[];
  String? email;
  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children:[TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue)=>email=newValue,
          onChanged: (value){
            if (value.isNotEmpty && errors.contains(kEmailNullError)){
              setState(() {
                errors.remove(kEmailNullError);
              });
            }else if(emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
              setState(() {
                errors.remove(kInvalidEmailError);
              });
            }
            return null;
          },
          validator: (value){
            if (value!.isEmpty && !errors.contains(kEmailNullError)){
              setState(() {
                errors.add(kEmailNullError);
              });
            }else if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
              setState(() {
                errors.add(kInvalidEmailError);
              });
            }
            return null;
          },
          decoration:const InputDecoration(
              hintText: "Enter to email",
              labelText: "Correo Electronico",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg")
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(30),),
        FormError(errors: errors),
        SizedBox(height: SizeConfig.screenHeight*0.1,),
        DefaultButton(text: "Continuar", press: (){
          if(_formkey.currentState!.validate()){
            //Do what yout want to do 
          }
        }),
        SizedBox(height: SizeConfig.screenHeight*0.1,),
        NoAccountText()
        ]
      ),
    );
  }
}