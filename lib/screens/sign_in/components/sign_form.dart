import 'package:flutter/material.dart';

import '../../../components/custom_icon_surffix.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error_file.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({ Key? key }) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}


class _SignFormState extends State<SignForm> {
  final _formkey=GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember=false;
  final List<String> errors=[];


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildEmailFormFile(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildPassFormFile(),
          SizedBox(height: getProportionateScreenHeight(30),),
          FormError(errors: errors),
          Row(
            children: [
              Checkbox(
                value: remember, 
                activeColor: kPrimaryColor,
                onChanged: (value){
                  setState(() {
                    remember=value;
                  });
                }
              ),
              const Text("Remember me"),
              Spacer(),
              const Text("Forgot Password", style: TextStyle(decoration: TextDecoration.underline),),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          DefaultButton(
            text: "Continue", 
            press: (){
              if(_formkey.currentState!.validate()){
                _formkey.currentState!.save();
              }

            }
          
          )
        ],
      ),
    );
  }

  TextFormField buildPassFormFile() {
    return TextFormField(
          obscureText: true,
          onSaved: (newValue)=>password=newValue,
          onChanged: (value){
            if (value.isNotEmpty && errors.contains(kPassNullError)){
              setState(() {
                errors.remove(kPassNullError);
              });
            }else if(value.length>=8 && errors.contains(kShortPassError)){
              setState(() {
                errors.remove(kShortPassError);
              });
            }
            return null;
          },
          validator: (value){
            if (value!.isEmpty && !errors.contains(kPassNullError)){
              setState(() {
                errors.add(kPassNullError);
              });
            }else if(value.length<8 && !errors.contains(kShortPassError)){
              setState(() {
                errors.add(kShortPassError);
              });
            }
            return null;
          },
          decoration:const InputDecoration(
              hintText: "Enter your password",
              labelText: "Password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg")
          ),
        );
  }

  TextFormField buildEmailFormFile() {
    return TextFormField(
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
              labelText: "Email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg")
          ),
        );
  }
}