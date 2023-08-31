import 'package:eve/bloc/userLogic.dart';
import 'package:eve/bloc/userState.dart';
import 'package:eve/models/user.dart';
import 'package:eve/models/events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'drawer.dart';
import 'eventDetails.dart';



class HomeWidget extends StatelessWidget {
  final User loggedInUser;
  HomeWidget({Key? key, required this.loggedInUser}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserLogic()..createDatabase(),
        child: BlocConsumer<UserLogic, UserState>(
            listener: (context, state) {},
            builder: (context, state) {
              UserLogic userTable = BlocProvider.of(context);
              TextEditingController searchEvent = TextEditingController();
              List eventsList = userTable.EventLst1;
              return DefaultTabController(
                  length: 4,
                  child: Scaffold(
                extendBodyBehindAppBar: true,
                key: scaffoldKey,
                appBar: AppBar(
                  bottom: TabBar(
                      tabs: [
                        Tab(text: 'Gaming'),
                        Tab(text: 'Musical'),
                        Tab(text: 'Stand-up'),
                        Tab(text: 'Others'),
                      ],
                    ),
                  backgroundColor: Colors.transparent,
                  // Set background color to transparent
                  elevation: 0,
                  title: Text("EVENTS", style: TextStyle(fontSize: 25)),
                  centerTitle: true,
                ),
                drawer: Menu(loggedInUser: loggedInUser),
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/bk.jpg',
                      ),
                    ),
                  ),
                    child:TabBarView(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 48.0),
                            child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(padding: EdgeInsets.all(35.0)),
                              if(eventsList.isNotEmpty)
                                for(int i=0;i<eventsList.length;i++)
                                   if(userTable.EventLst1[i].category=='gamimg'||userTable.EventLst1[i].category=='gaming'||userTable.EventLst1[i].category=='Gaming'||userTable.EventLst1[i].category=='Gamimg')
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                          alignment: AlignmentDirectional(0.18, 0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (c) {
                                                  return EventDetails(
                                                    event: userTable.EventLst1[i],);
                                                },
                                              ));
                                            },
                                            child: Card(
                                              shadowColor: Color(0xFFE14658),
                                              elevation: 4,
                                              margin: EdgeInsets.all(16),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/event4.jpg',
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    height: 200,
                                                  ),
                                                  Positioned(
                                                    bottom: 50,
                                                    left: 16,
                                                    right: 16,
                                                    child: Text(userTable.EventLst1[i].title, // Display event title here
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ), Positioned(
                                                    bottom: 16,
                                                    left: 16,
                                                    right: 16,
                                                    child: Text(userTable.EventLst1[i].location,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                  )
                            ],
                      ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 48.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(padding: EdgeInsets.all(35.0)),
                                if(eventsList.isNotEmpty)
                                  for(int i=0;i<eventsList.length;i++)
                                    if(userTable.EventLst1[i].category=='Musical')
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                              alignment: AlignmentDirectional(0.18, 0),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (c) {
                                                      return EventDetails(
                                                        event: userTable.EventLst1[i],);
                                                    },
                                                  ));
                                                },
                                                child: Card(
                                                  shadowColor: Color(0xFFE14658),
                                                  elevation: 4,
                                                  margin: EdgeInsets.all(16),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/musical.jpg',
                                                        fit: BoxFit.cover,
                                                        width: double.infinity,
                                                        height: 200,
                                                      ),
                                                      Positioned(
                                                        bottom: 50,
                                                        left: 16,
                                                        right: 16,
                                                        child: Text(userTable.EventLst1[i].title, // Display event title here
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 25,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ), Positioned(
                                                        bottom: 16,
                                                        left: 16,
                                                        right: 16,
                                                        child: Text(userTable.EventLst1[i].location,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              )
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 48.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(padding: EdgeInsets.all(35.0)),
                                if(eventsList.isNotEmpty)
                                  for(int i=0;i<eventsList.length;i++)
                                    if(userTable.EventLst1[i].category=='Stand-Up Comedy')
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                              alignment: AlignmentDirectional(0.18, 0),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (c) {
                                                      return EventDetails(
                                                        event: userTable.EventLst1[i],);
                                                    },
                                                  ));
                                                },
                                                child: Card(
                                                  shadowColor: Color(0xFFE14658),
                                                  elevation: 4,
                                                  margin: EdgeInsets.all(16),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/comedy.jpg',
                                                        fit: BoxFit.cover,
                                                        width: double.infinity,
                                                        height: 200,
                                                      ),
                                                      Positioned(
                                                        bottom: 50,
                                                        left: 16,
                                                        right: 16,
                                                        child: Text(userTable.EventLst1[i].title, // Display event title here
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 25,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ), Positioned(
                                                        bottom: 16,
                                                        left: 16,
                                                        right: 16,
                                                        child: Text(userTable.EventLst1[i].location,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              )
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 48.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(padding: EdgeInsets.all(35.0)),
                                if(eventsList.isNotEmpty)
                                  for(int i=0;i<eventsList.length;i++)
                                    if(userTable.EventLst1[i].category!='Musical'&&userTable.EventLst1[i].category!='Gamimg'&&userTable.EventLst1[i].category!='gamimg'&&userTable.EventLst1[i].category!='Gaming'&&userTable.EventLst1[i].category!='gaming'&&userTable.EventLst1[i].category!='Stand-Up Comedy')
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                              alignment: AlignmentDirectional(0.18, 0),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (c) {
                                                      return EventDetails(
                                                        event: userTable.EventLst1[i],);
                                                    },
                                                  ));
                                                },
                                                child: Card(
                                                  shadowColor: Color(0xFFE14658),
                                                  elevation: 4,
                                                  margin: EdgeInsets.all(16),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/other.jpg',
                                                        fit: BoxFit.cover,
                                                        width: double.infinity,
                                                        height: 200,
                                                      ),
                                                      Positioned(
                                                        bottom: 50,
                                                        left: 16,
                                                        right: 16,
                                                        child: Text(userTable.EventLst1[i].title, // Display event title here
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 25,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ), Positioned(
                                                        bottom: 16,
                                                        left: 16,
                                                        right: 16,
                                                        child: Text(userTable.EventLst1[i].location,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              )
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),

                      ]
                    ),
                  ),
                ),
              );
    }
    )

    );
  }
}