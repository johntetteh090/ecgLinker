import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomersProfilePage extends StatefulWidget {
  String text;
  CustomersProfilePage({Key key, @required this.text}) : super(key: key);
  @override
  _CustomersProfilePageState createState() => _CustomersProfilePageState(this.text);
}

class _CustomersProfilePageState extends State<CustomersProfilePage> {
  final String text;

  // receive data from the FirstScreen as a parameter
  _CustomersProfilePageState(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8.0,),
              //THE HEADER
              new Row(
                children: [
                  SizedBox(width: 8.0,),
                  GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: Icon(CupertinoIcons.arrow_left,color: Colors.black,size: 30.0,),
                  ),
                   SizedBox(width: 80.0,),
                   Text('Customer Profile',
                   style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.w700),)
                ],
              ),

              SizedBox(height: 50.0,),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 16.0),
                child: Text(text,
                  style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.w700),
                overflow: TextOverflow.ellipsis,),
              ),
              SizedBox(height: 8.0,),
              /*Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 16.0),
                child: RatingBarIndicator(
                  rating: 3,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
              ),
              SizedBox(height: 20.0,),*/
              /*Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 16.0),
                child: Text('4 jobs done',
                style: TextStyle(fontSize: 21.0),),
              ),
              SizedBox(height: 20.0,),*/
              //THE CALLING AND NUMBER
              new Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Telephone',
                      style: TextStyle(fontSize: 21.0),),
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                      height: 17.0,
                      width: 3.0,
                      //color: Colors.indigo,
                      child: Divider(height: 17.0,thickness: 20.0,)
                  ),
                  SizedBox(width: 5.0,),
                  Container(
                    child: Text('0558521657',
                      style: TextStyle(fontSize: 19.0,color: Colors.grey[500]),),
                  ),
                ],
              ),
              SizedBox(height:20.0),

              //THE CERTIFICATE ROW
             /* new Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Issuance of certification',
                    style: TextStyle(fontSize: 19.0),),
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                    height: 17.0,
                      width: 3.0,
                      //color: Colors.indigo,
                      child: Divider(height: 17.0,thickness: 20.0,)
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                    child: Text('14 - 09 - 04',
                    style: TextStyle(fontSize: 18.0,color: Colors.grey[500]),),
                  )
                ],
              ),

              SizedBox(height: 5.0,),
              //EXPIRATION OF CERTIFICATION
              new Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Expiration of certification',
                      style: TextStyle(fontSize: 19.0),),
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                      height: 17.0,
                      width: 3.0,
                      //color: Colors.indigo,
                      child: Divider(height: 17.0,thickness: 20.0,)
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                    child: Text('11 - 06 - 09',
                      style: TextStyle(fontSize: 18.0,color: Colors.grey[500]),),
                  )
                ],
              ),

              SizedBox(height: 5.0,),*/
              //RENEWAL OF CERTIFICATION
              new Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Location',
                      style: TextStyle(fontSize: 21.0),),
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                      height: 17.0,
                      width: 3.0,
                      //color: Colors.indigo,
                      child: Divider(height: 17.0,thickness: 20.0,)
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                    child: Text('Adenta',
                      style: TextStyle(fontSize: 19.0,color: Colors.grey[500]),),
                  ),
                ],
              ),

              //THE LOCATION TEXTFIELD
              /*SizedBox(height: 30.0,),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 16.0),
                width: MediaQuery.of(context).size.width/1.1,
                child: TextField(
                  decoration: InputDecoration(
                    //labelText: 'Username',
                    filled: true,
                    hintText: 'Location',
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,

                    ),

                  ),
                ),
              ),*/
              SizedBox(height: 80.0,),

              //THE PICK OFFICER BUTTON
              Container(
                width: MediaQuery.of(context).size.width/1.2,
                height: 50.0,
                child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                            "Accept Order",
                            style: TextStyle(fontSize: 21.0,color: Colors.white,)
                        ),
                        SizedBox(width: 35.0,),
                        //Icon(CupertinoIcons.arrow_right,color: Colors.white,size: 30.0,)
                      ],
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff0000ff)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide.none
                            )
                        )
                    ),
                    onPressed: () {
                      _showMyDialog();
                    }
                ),
              ),

              SizedBox(height:30.0),
              //THE DIVIDER
              Container(
                height: 8.0,
                  width: MediaQuery.of(context).size.width/2.5,
                  child: Divider(thickness: 3.0,)
              ),

              SizedBox(height:30.0),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text(' Officer who steal will be subject to disciplinary '
                    'action as follows: * 1st offense- out of organization suspension up to '
                    'five days; notification of board. \n * 2nd offense- out of organization '
                    'suspension up to five days; board conference; may be '
                    'referred to Board of Energy disciplinary action.',
                  style: TextStyle(fontSize: 15.0),
                ),
              )
            ],
          ),
        ),
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
                  Text('Order has been accepted successfully..',
                  style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),),
                  SizedBox(height: 25.0,),
                  Icon(CupertinoIcons.check_mark_circled,color: Colors.lightGreen,size: 55.0,)
                ],
              )
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
