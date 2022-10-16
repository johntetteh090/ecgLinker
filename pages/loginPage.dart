import 'package:ecg_linker/pages/signUpPageForCustomers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecg_linker/pages/signUpPage.dart';
import 'package:ecg_linker/pages/dashboard.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{
  final formKey = GlobalKey<FormState>();
  var email='';
  AnimationController controller;
  Animation<Offset> offset;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 35.0,),
            Container(
              padding: EdgeInsets.only(left: 16.0),
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Icon(CupertinoIcons.arrow_left,color: Colors.black,size: 30.0,),
              ),
            ),
            SizedBox(height: 15.0,),
            //LOGIN TEXT
            Container(
              padding: EdgeInsets.only(left: 16.0),
              alignment: Alignment.topLeft,
              child: Text('Login.',
              style: TextStyle(fontSize: 60.0,fontWeight: FontWeight.w700),),
            ),
            SizedBox(height: 10.0,),
            //THE TEXT TO SIGNIFY FOR ANY ACCOUNT
            new Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Dont have any Account?',)
                ),
               TextButton(
                   onPressed:(){
                     Navigator
                         .push(context, MaterialPageRoute(builder: (context) => SignUpPageForCustomers()));
                   },
                   child: Text('Register',
                   style: TextStyle(color: Color(0xff0000ff)),)
               )
              ],
            ),

            Container(
              width: MediaQuery.of(context).size.width/2.3,
                child: Divider(height: 8.0,thickness: 2.0,)
            ),
            SizedBox(height: 25.0,),
            //THE FORM FIELD
            Expanded(
              child: Form(
                key: formKey,
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: [
                      Text('Email',
                      style: TextStyle(fontSize: 21.0,color: Colors.black45),),
                      SizedBox(height: 10.0,),
                      SlideTransition(
                        position: offset,
                          child: buildEmail()
                      ),
                      SizedBox(height: 25.0,),
                      Text('Password',
                        style: TextStyle(fontSize: 21.0,color: Colors.black45),),
                      SizedBox(height: 10.0,),
                      SlideTransition(
                          position: offset,
                          child: buildPassword()
                      ),
                      SizedBox(height: 80.0,),
                      submitButton()
                    ],
                  )
              ),
            )
          ],
        )
      ),
    );
  }

  Widget buildEmail() {

    return TextFormField(
      decoration: InputDecoration(
        //labelText: 'Username',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,

        ),
        // errorBorder:
        //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        // focusedErrorBorder:
        //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        // errorStyle: TextStyle(color: Colors.purple),
      ),
      validator: (value) {
        final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
        final regExp = RegExp(pattern);

        if (value.isEmpty) {
          return 'Enter an email';
        } else if (!regExp.hasMatch(value)) {
          return 'Enter a valid email';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => setState(() => email = value),
    );
  }

 Widget buildPassword() {

   return TextFormField(
     decoration: InputDecoration(
       //labelText: 'Password',
       filled: true,
       fillColor: Colors.grey[200],
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(15.0),
         borderSide: BorderSide.none,

       ),
     ),
     validator: (value) {
       if (value.length < 7) {
         return 'Password must be at least 7 characters long';
       } else {
         return null;
       }
     },
     //onSaved: (value) => setState(() => password = value),
     keyboardType: TextInputType.visiblePassword,
     obscureText: true,
   );
 }

 Widget submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width/1.5,
      height: 50.0,
      child: ElevatedButton(
          child:  Text(
              "Login",
              style: TextStyle(fontSize: 30.0,color: Colors.white,)
          ),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xff3532A7),),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide.none
                  )
              )
          ),
          onPressed: () async{
           final isValid = formKey.currentState.validate();
           if(isValid){
             formKey.currentState.save();


             final SharedPreferences prefs = await SharedPreferences.getInstance();
             prefs.setString('first_name', 'Smith');
             final snackBar = SnackBar(
               content: Text(
                 'Logged in successfully',
                 style: TextStyle(fontSize: 20),
               ),
               backgroundColor: Colors.green,
             );
             ScaffoldMessenger.of(context).showSnackBar(snackBar);


             Navigator
                 .push(context, MaterialPageRoute(builder: (context) => Dashboard()));
           }
          }
      ),
    );
 }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset(0.0,2.0), end: Offset(0.0, 0.0))
        .animate(new CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.forward();
  }
}
