
import 'dart:math';
import 'dart:ui';

import 'package:eve/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

import '../drawer.dart';
import '../home.dart';
import 'createEvent.dart';

class homePage extends StatelessWidget
{
  final User loggedInUser;
  homePage({Key? key, required this.loggedInUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
     appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
        title: Text("EVE",style: TextStyle(fontSize: 25),),
       centerTitle:true,
     ),
      drawer: Menu(loggedInUser: loggedInUser),

      body:Container(
         width: double.infinity,
         height: double.infinity,
         decoration: BoxDecoration(
           color: Theme.of(context).backgroundColor,
           image: DecorationImage(
             fit: BoxFit.cover,
             image: AssetImage('assets/images/bk.jpg',
             ),
           ),
         ),
           child: InkWell(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(
                 builder: (c) {
                   return CreateEvent();
                 },
               ));
             },
             child: Padding(
               padding: const EdgeInsets.only(top: 50.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround  ,
                 children: [
                   Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                     child: Container(
                       width: double.infinity,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         boxShadow: [
                           BoxShadow(
                             blurRadius: 3,
                             color: Color(0x411D2429),
                             offset: Offset(0, 1),
                           )
                         ],
                         borderRadius: BorderRadius.circular(8),
                       ),
                       child: Padding(
                         padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                         child: Column(
                           mainAxisSize: MainAxisSize.max,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(6),
                                 child: Image.asset('assets/images/host.jpg',
                                 width: double.infinity,
                                   height: 120,
                                   fit: BoxFit.cover,
                                 ),
                               ),
                             ),
                             Padding(
                               padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                               child: Text(
                                 'Publish Your Event!',
                                 style:TextStyle(
                                   fontFamily: 'Plus Jakarta Sans',
                                   color: Color(0xFF101213),
                                   fontSize: 22,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ),
                             Padding(
                               padding: EdgeInsetsDirectional.fromSTEB(16, 4, 8, 0),
                               child: Text("Hosting an event is an exciting endeavor that involves meticulous planning, creativity, and effective coordination to bring people together for a purposeful gathering.",
                                 textAlign: TextAlign.start,
                                 style: TextStyle(
                                   fontFamily: 'Plus Jakarta Sans',
                                   color: Color(0xFF57636C),
                                   fontSize: 14,
                                   fontWeight: FontWeight.w500,
                                 ),
                               ),
                             ),
                             Padding(
                               padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                               child: Row(
                                 mainAxisSize: MainAxisSize.max,
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Padding(
                                     padding: EdgeInsetsDirectional.fromSTEB(0, 8, 4, 8),
                                     child: Text(
                                       'Create Your Own',
                                       textAlign: TextAlign.end,
                                       style: TextStyle(
                                         fontFamily: 'Urbanist',
                                         color: Color(0xFF101213),
                                         fontSize: 18,
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ),
                                   ),
                                   Icon(
                                     Icons.chevron_right_rounded,
                                     color: Color(0xFF57636C),
                                     size: 24,
                                   ),
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                     child: Container(
                       width: double.infinity,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         boxShadow: [
                           BoxShadow(
                             blurRadius: 3,
                             color: Color(0x411D2429),
                             offset: Offset(0, 1),
                           )
                         ],
                         borderRadius: BorderRadius.circular(8),
                       ),
                       child: InkWell(
                        onTap: () {
                               Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) {
                               return HomeWidget(loggedInUser: loggedInUser);
                                },
                             ));
                        },
                         child: Padding(
                           padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                           child: Column(
                             mainAxisSize: MainAxisSize.max,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding: EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(6),
                                   child: Image.asset('assets/images/user.jpg',
                                     width: double.infinity,
                                     height: 120,
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                                 child: Text(
                                   'Attend An Event!',
                                   style:TextStyle(
                                     fontFamily: 'Plus Jakarta Sans',
                                     color: Color(0xFF101213),
                                     fontSize: 22,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsetsDirectional.fromSTEB(16, 4, 8, 0),
                                 child: Text("Attending an event offers a valuable opportunity to engage, learn, and connect with others who share common interests or goals. ",
                                   textAlign: TextAlign.start,
                                   style: TextStyle(
                                     fontFamily: 'Plus Jakarta Sans',
                                     color: Color(0xFF57636C),
                                     fontSize: 14,
                                     fontWeight: FontWeight.w500,
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                 child: Row(
                                   mainAxisSize: MainAxisSize.max,
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Padding(
                                       padding: EdgeInsetsDirectional.fromSTEB(0, 8, 4, 8),
                                       child: Text(
                                         'Head To Home',
                                         textAlign: TextAlign.end,
                                         style: TextStyle(
                                           fontFamily: 'Urbanist',
                                           color: Color(0xFF101213),
                                           fontSize: 18,
                                           fontWeight: FontWeight.w500,
                                         ),
                                       ),
                                     ),
                                     Icon(
                                       Icons.chevron_right_rounded,
                                       color: Color(0xFF57636C),
                                       size: 24,
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ),
   );
  }

}