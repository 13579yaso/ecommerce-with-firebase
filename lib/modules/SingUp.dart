import 'package:first_app/modules/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CustomStateFulTextField.dart';
import 'CustomTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SingUpScreen extends StatefulWidget {
  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  Color greyColor =const Color(0xffA71E27);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: 35,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Sign\nUp',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 64,
                child:CustomTextField(
                  label: "Name",
                  customController: nameController,
                )
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 64,
                child: CustomTextField(
                  label: "Email",
                  customController: emailController,
                )
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 64,
                child: CustomTextField(
                  label: "Phone",
                  customController: phoneController,
                )
            ),
            SizedBox(
              height: 10,
            ),
            CustomStateFulTextField(
              label: "Password",
              controller: passwordController,
            ),
            SizedBox(
              height: 10,
            ),
            CustomStateFulTextField(
              label: "Confirm Password",
            ),
            SizedBox(
              height: 20,

            ),
           Row(
             children: [
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
                     Navigator.pop(context);
                   },
                   child: Text(
                     'Back',
                     style: TextStyle(
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                     ),
                   ),
                 ),
               ),
               SizedBox(
                 width: 5,
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
                     register(context,emailController.text, passwordController.text);
                   },
                   child: Text(
                     'Register',
                     style: TextStyle(
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                     ),
                   ),
                 ),
               ),
             ],
           )

          ],
        ),
      ),

    );
  }
  void register(BuildContext context,String userEmail , String userPassword)async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userEmail,
      password: userPassword,
    ).then((value) {
      // when success
      print("result from registeration${value.user?.uid}");
      CollectionReference usersRef = FirebaseFirestore.instance.collection("users");
      usersRef.doc(value.user?.uid).set({
        "userID":value.user?.uid,
        "userName":nameController.text,
        "userPhone":phoneController.text,
        "userEmail":emailController.text,
      }).then((value) {
        print("user added");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder:(co)=>HomeScreen()),
              (route)=>false,
        );
      },onError: (err){print(err.toString());});
    },onError: (errorMessage){
      // when error
      print("result from on error ${errorMessage.toString()}");
    });

  }
}