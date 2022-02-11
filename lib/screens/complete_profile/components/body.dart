import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_icon_surffix.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text("Complete Profile",style: headingStyle,),
            Text("Complete your details or continue \nwith social media",textAlign: TextAlign.center,),
            CompleteProfileForm()
          ],
        ),
      ),
    );
  }
}

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({ Key? key }) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey=GlobalKey<FormState>();
  final List<String>errors=[];
  String? firstName,lastName,phoneNumber,address;

  void addError({required String error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}){
    if(!errors.contains(error)){
      setState(() {
        errors.remove(error);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue)=>firstName=newValue,
            onChanged: (value){
              /*if(value.isNotEmpty){
                removeError(error: kEmailNullError);
              }else if(emailValidatorRegExp.hasMatch(value)){
                removeError(error: kInvalidEmailError);
              }*/
              if(value.isEmpty){
                addError(error: kNamelNullError);
                
              }
              return null;
            },
            validator: (value){
              /*if(value!.isNotEmpty){
                removeError(error: kEmailNullError);
                return "";
              }else if(emailValidatorRegExp.hasMatch(value)){
                removeError(error: kInvalidEmailError);
                return "";
              }*/
              if(value!.isEmpty){
                addError(error: kNamelNullError);
                return "";
              }
              return null;
            },
            decoration:const InputDecoration(
                hintText: "Enter your first name",
                labelText: "First Name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")
            ),
          )
        ],
      ),
    );
  }
}