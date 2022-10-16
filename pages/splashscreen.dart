import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecg_linker/pages/serviceChoose.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var color = const Color(0xff3532A7);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: color,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //THE ECG TEXT
              new Row(
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
                ],
              ),

              // LINKER TEXT
              /*new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('linker',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 30.0),
                  ),
                  SizedBox(width: 50.0,)
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 4),()async{

        Navigator
            .pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ServiceChoose()), (route) => false);
    }
    );
  }
}
