import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WorkProgress extends StatefulWidget {
  String text;
  WorkProgress({Key key, @required this.text}) : super(key: key);
  @override
  _WorkProgressState createState() => _WorkProgressState(this.text);
}

class _WorkProgressState extends State<WorkProgress> {
  final String text;

  // receive data from the FirstScreen as a parameter
  _WorkProgressState(this.text);

  String dropdownvalue = 'Select progress';

  var items =  ['Select progress','Work on-going','Completed','Delayed','Not started'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 12.0,),
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
                    Text('Performance',
                      style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700),)
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

                //SizedBox(height: 20.0,),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text('4 jobs done',
                    style: TextStyle(fontSize: 21.0),),
                ),
                SizedBox(height: 50.0,),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text('Rate his performance',
                  style: TextStyle(fontSize: 18.0),),

                ),
                SizedBox(height: 8.0,),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 16.0),
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                ),
                SizedBox(height: 50.0,),
                Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  height: 50.0,
                  padding: EdgeInsets.only(left:16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: Colors.grey[200], style: BorderStyle.solid, width: 0.80),
                  ),
                  child:DropdownButtonHideUnderline(
                    child: DropdownButton(
                      elevation: 0,
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),

                      items:items.map((String items) {
                        return DropdownMenuItem(
                            value: items,
                            child: Text(items)
                        );

                      }

                      ).toList(),
                      onChanged: (String newValue){
                        setState(() {
                          dropdownvalue = newValue;
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: 90.0,),

                //THE SUBMIT BUTTON
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: 50.0,
                  child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                              "Submit",
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
              ],
            ),
          )
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
                    Text('Progress submitted successfully..',
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
