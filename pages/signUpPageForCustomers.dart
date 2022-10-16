import 'package:ecg_linker/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecg_linker/pages/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignUpPageForCustomers extends StatefulWidget {
  @override
  _SignUpPageForCustomersState createState() => _SignUpPageForCustomersState();
}

class _SignUpPageForCustomersState extends State<SignUpPageForCustomers> with TickerProviderStateMixin{
  final formKey = GlobalKey<FormState>();
  var email='';
  var firstname='';
  var lastname='';
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
              child: Text('Welcome to ECG linker',
              style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w500,color: Colors.grey[400]),),
            ),
            SizedBox(height: 10.0,),
            //THE TEXT TO SIGNIFY FOR ANY ACCOUNT
            Container(
                padding: EdgeInsets.only(left: 16.0),
                child: Text('By creating an account, you agree to ECG linkers',
                style: TextStyle(color: Colors.grey[400]),)
            ),
               Container(
                 child: Text('Terms of Service,Privacy Policy and to pay a ',
                 style: TextStyle(color: Colors.grey[400]),),
               ),
            Container(
              child: Text('token to proceed with registration.',
                style: TextStyle(color: Colors.grey[400]),),
            ),

            SizedBox(height: 15.0,),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
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

                      //THE NAME CLAUSE
                      Text('First Name',
                        style: TextStyle(fontSize: 21.0,color: Colors.black45),),
                      SizedBox(height: 10.0,),
                      SlideTransition(
                          position: offset,
                          child:firstName()
                      ),

                      SizedBox(height: 25.0,),
                      //LAST NAME CLAUSE
                      Text('Last Name',
                        style: TextStyle(fontSize: 21.0,color: Colors.black45),),
                      SizedBox(height: 10.0,),
                      SlideTransition(
                          position: offset,
                          child: lastName()
                      ),

                      SizedBox(height: 25.0,),
                      //EMAIL CLAUSE
                      Text('Email',
                      style: TextStyle(fontSize: 21.0,color: Colors.black45),),
                      SizedBox(height: 10.0,),
                      SlideTransition(
                        position: offset,
                          child: buildEmail()
                      ),
                      SizedBox(height: 25.0,),

                      //THE FIRST PASSWORD
                      Text('Password',
                        style: TextStyle(fontSize: 21.0,color: Colors.black45),),
                      SizedBox(height: 10.0,),
                      SlideTransition(
                          position: offset,
                          child: buildPassword()
                      ),
                      SizedBox(height: 25.0,),


                      //THE SECOND PASSWORD
                      Text('Repeat Password',
                        style: TextStyle(fontSize: 21.0,color: Colors.black45),),
                      SizedBox(height: 10.0,),
                      SlideTransition(
                          position: offset,
                          child: buildPassword()
                      ),
                      SizedBox(height: 25.0,),
                      //THE CERTIFICATION NUMBER
                      /*Text('Certification Number',
                        style: TextStyle(fontSize: 21.0,color: Colors.black45),),
                      SizedBox(height: 10.0,),
                      SlideTransition(
                          position: offset,
                          child: certificationNumber()
                      ),
                      SizedBox(height: 80.0,),*/
                      submitButton(),
                      SizedBox(height: 25.0,),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text('Already have an Account?',
                              style: TextStyle(color: Colors.grey[400]),)
                          ),
                          TextButton(
                              onPressed:(){
                                Navigator
                                    .push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                              },
                              child: Text('Log in',
                                style: TextStyle(color: Color(0xff0000ff)),)
                          )
                        ],
                      ),
                    ],
                  )
              ),
            )
          ],
        )
      ),
    );
  }

  Widget firstName() {
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
        if (value.length < 1) {
          return 'Fields cannot be empty';
        } else {
          return null;
        }
      },
      onChanged: (value) => setState(() => firstname = value),

    );
  }

 Widget lastName() {

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
       if (value.length < 1) {
         return 'Field cannot be empty';
       } else {
         return null;
       }
     },
     onSaved: (value) => setState(() => lastname = value),
     //keyboardType: TextInputType.visiblePassword,

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

  Widget certificationNumber() {

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
        if (value.length < 5) {
          return 'Certification number incomplete';
        } else {
          return null;
        }
      },
      //onSaved: (value) => setState(() => lastname = value),
      keyboardType: TextInputType.text,
    );
  }


 Widget submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width/1.5,
      height: 50.0,
      child: ElevatedButton(
          child:  Text(
              "sign up",
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
             _showMyDialog();
           }
          }
      ),
    );
 }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(

            child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.0,),
                    Text('You are making a payment for ECG linker(10 Ghana Cedis). Enter your pin to make transaction',
                      style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),),
                    SizedBox(height: 10.0,),
                    //Icon(CupertinoIcons.check_mark_circled,color: Colors.lightGreen,size: 55.0,)
                    TextField(),
                    SizedBox(height: 10.0,),
                  ],
                )
            ),
          ),
          actions: <Widget>[

            //THE NO BUTTON
            TextButton(
              child: const Text('Cancel',
                style: TextStyle(color: Colors.redAccent),),
              onPressed: () async{
                Navigator.of(context).pop();
              },
            ),


            TextButton(
              child: const Text('ok'),
              onPressed: () async{
                //Navigator.of(context).pop();
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('first_name', firstname);
                prefs.setString('last_name', lastname);
                final snackBar = SnackBar(
                  content: Text(
                    'signed up successfully',
                    //firstname,
                    style: TextStyle(fontSize: 20),
                  ),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator
                    .push(context, MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),


          ],
        );
      },
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
