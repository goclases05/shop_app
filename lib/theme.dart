import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

ThemeData theme(){
  return ThemeData(
        //primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        appBarTheme: appBarTheme(),
        textTheme:const TextTheme(
          bodyText1: TextStyle(color:kTextColor),
          bodyText2: TextStyle(color:kTextColor),
        ),
        inputDecorationTheme: inputDecorationTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color:kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 42,vertical: 20),
          enabledBorder: outlineInputBorder,
          focusedBorder:outlineInputBorder, 
          border: outlineInputBorder
      );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 20)
      );
}