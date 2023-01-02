import 'package:flutter/material.dart';
import 'package:spms/pages/LoginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/menu_controller.dart';
import 'pages/home_page.dart';

/*
Title:Entry Point of a Web Application
Purpose:Entry Point of a Web Application
Created By:Isuru Weerasinghe
Created Date: 20 Feb 2022
*/

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SPMS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),
        home: LoginScreen()
        // MultiProvider(
        //   // providers: [
        //   //   ChangeNotifierProvider(
        //   //     create: (context) => MenuController(),
        //   //   ),
        //   // ],
        //   child: HomePage(),
        // ),
        );
  }
}
