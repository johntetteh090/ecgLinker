import 'package:ecg_linker/pages/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecg_linker/pages/loginPage.dart';
import 'package:ecg_linker/pages/signUpPageForCustomers.dart';
class ServiceChoose extends StatefulWidget {
  @override
  _ServiceChooseState createState() => _ServiceChooseState();
}

class _ServiceChooseState extends State<ServiceChoose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    body: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height: MediaQuery.of(context).size.height/3,
            color: Color(0xff3532A7),
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(CupertinoIcons.wrench_fill,color: Colors.white,size: 45.0,),
                     SizedBox(width: 10.0,),
                     Text('ECG ',
                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 50.0),
                     ),
                     Text('linker',
                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 50.0),
                     ),
                     SizedBox(height: 120.0,),

                   ],
                 ),
                 //THE TEXT ABOUT CHOOSING OPTION AND HELP COMES
                 Container(
                   child: Text('Choose an option and lets find a',
                     style: TextStyle(fontSize: 18.0,color: Colors.white),),
                 ),
                 Container(
                   child: Text('solution to your problem.',
                     style: TextStyle(fontSize: 18.0,color: Colors.white),),
                 ),
               ],
             ),
           ),
          ),

          SizedBox(height: 30.0,),
          //THE ECG OFFICER BUTTON
          Container(
            width: MediaQuery.of(context).size.width/1.5,
            height: 50.0,
            child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "C-ECG Es",
                        style: TextStyle(fontSize: 30.0,color: Colors.white,)
                    ),
                    SizedBox(width: 35.0,),
                    Icon(CupertinoIcons.arrow_right,color: Colors.white,size: 30.0,)
                  ],
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff3532A7)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide.none
                        )
                    )
                ),
                onPressed: () {
                  Navigator
                      .push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                }
            ),
          ),

          SizedBox(height: 30.0,),

          //THE CUSTOMER BUTTON
          Container(
            width: MediaQuery.of(context).size.width/1.5,
           height: 50.0,
            child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                        "Customer",
                        style: TextStyle(fontSize: 30.0,color: Colors.black)
                    ),
                    SizedBox(width: 35.0,),
                    Icon(CupertinoIcons.arrow_right,color: Colors.black,size: 30.0,)
                  ],
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.black54)
                        )
                    )
                ),
                onPressed: () {

                  Navigator
                      .push(context, MaterialPageRoute(builder: (context) => SignUpPageForCustomers()));
                }
            ),
          )
        ],
      ),
    ),
    );

  }
}
