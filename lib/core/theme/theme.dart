import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.white,
    unselectedWidgetColor: Colors.grey,
    fontFamily: 'NanumGothic',
    //-------------- start app Bar theme ---------------//
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 25,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
        size: 30,
      ),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
    ),
    //--------------- End app bar theme ---------------//

    //--------------- Start input theme --------------//
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        suffixIconColor: Colors.grey,
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        hoverColor: Colors.grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(color: Colors.white)),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        iconColor: Colors.grey,
        prefixIconColor: Colors.grey,
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300)),
    //--------------- End input theme ----------------//

    //--------------- Start Button Theme -------------//
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.purple,
      height: 50,
      textTheme: ButtonTextTheme.primary,
    ),
    //--------------- End Button Theme --------------//

    //------------ Start text Theme ----------------//
    textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        titleSmall: TextStyle(
            fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w800),
        titleMedium: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.black87,
        ),
        bodySmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        )),
    //------------ end text Theme ------------------//

    //------------ Start Card Theme ------------------//
    cardColor: Colors.white,
    cardTheme: const CardTheme(
      elevation: 3,
      shadowColor: Colors.grey,
    ),
    //------------ End Card Theme -------------------//

    //------------ Start bottom Nav Theme ------------------//
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        selectedIconTheme: IconThemeData(
          color: Colors.red,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true),
    //------------ End bottom Nav Theme -------------------//
  );
  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.orangeAccent,
    scaffoldBackgroundColor: Colors.black54,
    unselectedWidgetColor: Colors.grey[700],
    fontFamily: 'NanumGothic',

    //-------------- start app Bar theme ---------------//
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 25,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
        size: 30,
      ),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
    ),
    //--------------- End app bar theme ---------------//

    //--------------- Start input theme --------------//
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        suffixIconColor: Colors.grey,
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        hoverColor: Colors.grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(color: Colors.white)),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        iconColor: Colors.grey,
        prefixIconColor: Colors.grey,
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300)),
    //--------------- End input theme ----------------//

    //--------------- Start Button Theme -------------//
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.purple,
      height: 50,
      textTheme: ButtonTextTheme.primary,
    ),
    //--------------- End Button Theme --------------//

    //------------ Start text Theme ----------------//
    textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        titleSmall: TextStyle(
            fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w800),
        titleMedium: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.black87,
        ),
        bodySmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        )),
    //------------ end text Theme ------------------//

    //------------ Start Card Theme ------------------//
    cardColor: Colors.white,
    cardTheme: const CardTheme(
      elevation: 3,
      shadowColor: Colors.grey,
    ),
    //------------ End Card Theme -------------------//

    //------------ Start bottom Nav Theme ------------------//
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        selectedIconTheme: IconThemeData(
          color: Colors.red,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true),
    //------------ End bottom Nav Theme -------------------//
  );
}
