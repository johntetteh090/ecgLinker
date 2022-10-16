
import 'package:ecg_linker/pages/profilePage.dart';
import 'package:ecg_linker/pages/work_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

var firstname,lastname;
String dropdownvalue = 'Accra';

var items =  ['Accra','Adenta','Tema','Koforidua','East Legon','Lapaz','Korle gorno','Kumasi','Tamale','Tesano','Dansoman',
                 'Cape coast','Takoradi','Sunyani',];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPreferences();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child: Column(
         children: [
           SizedBox(height:30.0),
           //THE NAME OF THE USER AND NOTIFICATION ICON
           new Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                 width:MediaQuery.of(context).size.width/1.7,
                 padding: EdgeInsets.only(left: 16.0),
                 alignment: Alignment.topLeft,
                 child: Text('Hi $firstname',
                   style: TextStyle(fontSize: 60.0,fontWeight: FontWeight.w700),
                 overflow: TextOverflow.ellipsis,),
               ),
               //THE ICON
               IconButton(
                   icon: Icon(CupertinoIcons.bell,size:35.0,color: Color(0xff0000ff),),
                   onPressed: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => WorkProgress(text: 'Kojo Odoi',),
                         ));
                   }
               ),

             ],
           ),
           SizedBox(height: 10.0,),
           Container(
             //width:MediaQuery.of(context).size.width/2,
             padding: EdgeInsets.only(left: 16.0),
             alignment: Alignment.center,
             child: Text('You have 30 days left on registration',
               style: TextStyle(color: Colors.grey[400]),
               overflow: TextOverflow.ellipsis,),
           ),
           SizedBox(height: 50.0,),


           //THE DROP DOWN MENU
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
           SizedBox(height:30.0),
           Expanded(
             child: ListView(
               children: [
                 //FIRST
                Container(
                  child: ListTile(
                    title: Text('Kojo Odoi',
                    style: TextStyle(fontSize: 31.0,color: Colors.black,fontWeight: FontWeight.w400),),
                    subtitle: RatingBarIndicator(
                      rating: 4,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    ),
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(text: 'Kojo Odoi',),
                          ));
                    },
                  ),
                ),
                 //SECOND
                 Container(
                   child: ListTile(
                     title: Text('Kwame Odai',
                       style: TextStyle(fontSize: 31.0,color: Colors.black,fontWeight: FontWeight.w400),),
                     subtitle: RatingBarIndicator(
                       rating: 5,
                       itemBuilder: (context, index) => Icon(
                         Icons.star,
                         color: Colors.amber,
                       ),
                       itemCount: 5,
                       itemSize: 30.0,
                       direction: Axis.horizontal,
                     ),
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => ProfilePage(text: 'Kwame Odai',),
                           ));
                     },
                   ),
                 ),
                 //THIRD
                 Container(
                   child: ListTile(
                     title: Text('Kusi Kumi',
                       style: TextStyle(fontSize: 31.0,color: Colors.black,fontWeight: FontWeight.w400),),
                     subtitle: RatingBarIndicator(
                       rating: 1,
                       itemBuilder: (context, index) => Icon(
                         Icons.star,
                         color: Colors.amber,
                       ),
                       itemCount: 5,
                       itemSize: 30.0,
                       direction: Axis.horizontal,
                     ),
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => ProfilePage(text: 'Kusi Kumi',),
                           ));
                     },
                   ),
                 ),
                 //FOURTH
                 Container(
                   child: ListTile(
                     title: Text('Alice Yuri',
                       style: TextStyle(fontSize: 31.0,color: Colors.black,fontWeight: FontWeight.w400),),
                     subtitle: RatingBarIndicator(
                       rating: 3,
                       itemBuilder: (context, index) => Icon(
                         Icons.star,
                         color: Colors.amber,
                       ),
                       itemCount: 5,
                       itemSize: 30.0,
                       direction: Axis.horizontal,
                     ),
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => ProfilePage(text: 'Alice Yuri',),
                           ));
                     },
                   ),
                 ),
                 //FIFTH
                 Container(
                   child: ListTile(
                     title: Text('Joseph Odame',
                       style: TextStyle(fontSize: 31.0,color: Colors.black,fontWeight: FontWeight.w400),),
                     subtitle: RatingBarIndicator(
                       rating: 2,
                       itemBuilder: (context, index) => Icon(
                         Icons.star,
                         color: Colors.amber,
                       ),
                       itemCount: 5,
                       itemSize: 30.0,
                       direction: Axis.horizontal,
                     ),
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => ProfilePage(text: 'Joseph Odame',),
                           ));
                     },
                   ),
                 ),
                 //SIXTH
                 Container(
                   child: ListTile(
                     title: Text('Calvin Boye',
                       style: TextStyle(fontSize: 31.0,color: Colors.black,fontWeight: FontWeight.w400),),
                     subtitle: RatingBarIndicator(
                       rating: 3.5,
                       itemBuilder: (context, index) => Icon(
                         Icons.star,
                         color: Colors.amber,
                       ),
                       itemCount: 5,
                       itemSize: 30.0,
                       direction: Axis.horizontal,
                     ),
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => ProfilePage(text: 'Calvin Boye',),
                           ));
                     },
                   ),
                 ),
                 //SEVENTH
                 Container(
                   child: ListTile(
                     title: Text('Esther Joy',
                       style: TextStyle(fontSize: 31.0,color: Colors.black,fontWeight: FontWeight.w400),),
                     subtitle: RatingBarIndicator(
                       rating: 4.79,
                       itemBuilder: (context, index) => Icon(
                         Icons.star,
                         color: Colors.amber,
                       ),
                       itemCount: 5,
                       itemSize: 30.0,
                       direction: Axis.horizontal,
                     ),
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => ProfilePage(text: 'Esther Joy',),
                           ));
                     },
                   ),
                 ),
                 //EIGHT
                 Container(
                   child: ListTile(
                     title: Text('Keath Smith',
                       style: TextStyle(fontSize: 31.0,color: Colors.black,fontWeight: FontWeight.w400),),
                     subtitle: RatingBarIndicator(
                       rating: 2.75,
                       itemBuilder: (context, index) => Icon(
                         Icons.star,
                         color: Colors.amber,
                       ),
                       itemCount: 5,
                       itemSize: 30.0,
                       direction: Axis.horizontal,
                     ),
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => ProfilePage(text: 'Keath Smith',),
                           ));
                     },
                   ),
                 ),
                 //NINTH
                 Container(
                   child: ListTile(
                     title: Text('Nana Kwame',
                       style: TextStyle(fontSize: 31.0,color: Colors.black,fontWeight: FontWeight.w400),),
                     subtitle: RatingBarIndicator(
                       rating: 5,
                       itemBuilder: (context, index) => Icon(
                         Icons.star,
                         color: Colors.amber,
                       ),
                       itemCount: 5,
                       itemSize: 30.0,
                       direction: Axis.horizontal,
                     ),
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => ProfilePage(text: 'Nana Kwame',),
                           ));
                     },
                   ),
                 ),
                 //TENTH
                 Container(
                   child: ListTile(
                     title: Text('Mary Furgurson',
                       style: TextStyle(fontSize: 31.0,color: Colors.black,fontWeight: FontWeight.w400),),
                     subtitle: RatingBarIndicator(
                       rating: 2.4,
                       itemBuilder: (context, index) => Icon(
                         Icons.star,
                         color: Colors.amber,
                       ),
                       itemCount: 5,
                       itemSize: 30.0,
                       direction: Axis.horizontal,
                     ),
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => ProfilePage(text:'Mary Furgurson',),
                           ));
                     },
                   ),
                 )
               ],
             ),
           )
         ],
       ),
      ),
    );
  }

  void getPreferences() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstname=prefs.getString('first_name');
      lastname=prefs.getString('last_name');
    });

  }
}
