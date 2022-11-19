import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CustomTextField.dart';
import 'HomeScreen.dart';
import 'SingUp.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color greyColor =const Color(0xffA71E27);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
       title: Text(
         "Login Screen",style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 30,
         color: Colors.black

       ),
       ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              height: 64,
              child:CustomTextField(
                label: "email",
                customController: emailController,
              )
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 64,
              child: CustomTextField(
                label: "password",
               customController: passwordController,
              )
          ),
          SizedBox(
            height: 20,

          ),
          Center(
            child: Text(
              "Don'\tt have an account",
            ),
          ),
          SizedBox(
            height: 20,

          ),
          Container(
            width: 150,
            height: 64,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: greyColor.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: greyColor,
              borderRadius: BorderRadius.circular(28),
            ),
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder:(context)=>SingUpScreen()));
              },
              child: Text(
                'SIGN UP',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,

          ),
          Container(
            width: 150,
            height: 64,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: greyColor.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: greyColor,
              borderRadius: BorderRadius.circular(28),
            ),
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                signIn(emailController.text,passwordController.text,context);
              },
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,

          ),
          Container(
            width: 150,
            height: 64,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: greyColor.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: greyColor,
              borderRadius: BorderRadius.circular(28),
            ),
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  HomeScreen()),
                );
              },
              child: Text(
                'Home',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void signIn(String mail,String password, BuildContext context)async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: mail,
          password: password
      ).then((value) {
        print("logged in ${value.user?.uid}");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder:(co)=>HomeScreen()),
              (route)=>false,
        );
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}

