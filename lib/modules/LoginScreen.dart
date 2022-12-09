import 'package:flutter/material.dart';
import '../data/repository_implementation/auth_repository_implementation.dart';
import '../domain/usecase/login_usecase.dart';
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
  late LoginUseCase _loginUseCase;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginUseCase = LoginUseCase(AuthRepositoryImplementation());
  }
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
              onTap: ()async {
                final result = await _loginUseCase.loginUseCase(
                    emailController.text, passwordController.text);
                if (result == null) {
                  print("Error");
                } else {
                  print(result.user?.uid);
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => HomeScreen()),
                        (route) => false,
                  );
                }
              },
                               child: Text(
                'Log In',
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

}

