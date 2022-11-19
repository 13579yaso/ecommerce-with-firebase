import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/modules/product_detiles.dart';
import 'package:flutter/material.dart';
import 'modules/LoginScreen.dart';
import 'modules/SingUp.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color greyColor =const Color(0xffA71E27);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: greyColor
      ),
        debugShowCheckedModeBanner: false,
        home:LoginScreen()
    );
  }
}












