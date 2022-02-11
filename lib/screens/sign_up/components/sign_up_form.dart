import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_icon_surffix.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error_file.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({ Key? key }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey=GlobalKey<FormState>();
  String? email,password,conform_paswword;
  final List<String>errors=[];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormFile(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildPassWordEmail(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildConformPassword(),
          SizedBox(height: getProportionateScreenHeight(30),),
          FormError(errors: errors),
          DefaultButton(text: "Continuar", press: (){
            if(_formKey.currentState!.validate()){
              //go to compleate profile page
              Navigator.pushNamed(context, CompleteProfileScreen.routeName);
            }
          })
        ],
      ),
    );
  }

  TextFormField buildConformPassword() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue)=>conform_paswword=newValue,
      onChanged: (value){
        if (password==conform_paswword){
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
        return null;
      },
      validator: (value){
        if (value!.isEmpty && !errors.contains(kPassNullError)){
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        }else if(password!=value){
          setState(() {
            errors.add(kMatchPassError);
          });
          return "";
        }
        return null;
      },
      decoration:const InputDecoration(
          hintText: "Re-enter your password",
          labelText: "Confirm Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg")
      ),
    );
  }

  TextFormField buildPassWordEmail() {
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
            password=value;
            return null;
          }else if(value.length<8 && !errors.contains(kShortPassError)){
            setState(() {
              errors.add(kShortPassError);
            });
            return "";
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
              return "";
            }else if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
              setState(() {
                errors.add(kInvalidEmailError);
              });
              return "";
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