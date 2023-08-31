import 'dart:ffi';
import 'dart:ui';
import 'package:eve/bloc/userLogic.dart';
import 'package:eve/bloc/userState.dart';
import 'package:eve/models/user.dart';
import 'package:eve/screens/creator/homePage.dart';
import 'package:eve/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';
class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    void _showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor:Color(0xFFE14053),
      ));
    }
    User loggedInUser = User(
      id: -1, // Some default value
      username: '', // Some default value
      email: '', // Some default value
      password: '', // Some default value
      firstName: '', // Some default value
      lastName: '', // Some default value
      type: '', // Some default value
    );
    bool _isPasswordVisible = false;

// Initialize with an empty User object

    TextEditingController email= TextEditingController();
    TextEditingController password= TextEditingController();
    return BlocProvider(create: (context) => UserLogic()..createDatabase(),
        child: BlocConsumer<UserLogic, UserState>(
            listener: (context, state) {},
            builder: (context, state) {
              UserLogic userTable = BlocProvider.of(context);
              List usersCheck=[];
              User loggedInUser;

              // Future<bool> checkLogin(String email,String password) async {
              //   final userData = await userTable.showData(userTable.db);
              //   for (int i = 0; i < userData.length; i++) {
              //     if (email == userData[i]['username'] &&
              //         password == userData[i]['password'] &&
              //         userData[i]['type'] == 'user') {
              //       loggedInUser = User(
              //         id: userData[i]['id'],
              //         username: userData[i]['username'],
              //         email: userData[i]['email'],
              //         password: userData[i]['password'],
              //         firstName: userData[i]['firstName'],
              //         lastName: userData[i]['lastName'],
              //         type: userData[i]['type'],
              //       );
              //       return true;
              //     }
              //   }
              //   return false;
              // }
              Future<bool> checkLoginCreator() async {
                await userTable.createDatabase();

                final usersCheck = await userTable.showData(userTable.db);

                for (int i = 0; i < usersCheck.length; i++) {
                  if (email.text == usersCheck[i]['email'] &&
                      password.text == usersCheck[i]['password']
                      &&
                      usersCheck[i]['type'] == 'creator') {
                    loggedInUser = User(
                      id: usersCheck[i]['id'],
                      username: usersCheck[i]['username'],
                      email: usersCheck[i]['email'],
                      password: usersCheck[i]['password'],
                      firstName: usersCheck[i]['firstName'],
                      lastName: usersCheck[i]['lastName'],
                      type: usersCheck[i]['type'],
                    );
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) {
                        return homePage(loggedInUser:loggedInUser,);
                      },
                    ));
                    return true;
                  }
                }

                return false;
              }
              Future<bool> checkLoginUser() async {
                await userTable.createDatabase();

                final usersCheck = await userTable.showData(userTable.db);

                for (int i = 0; i < usersCheck.length; i++) {
                  if (email.text == usersCheck[i]['email'] &&
                      password.text == usersCheck[i]['password']
                      &&
                      usersCheck[i]['type'] == 'user') {
                    loggedInUser = User(
                      id: usersCheck[i]['id'],
                      username: usersCheck[i]['username'],
                      email: usersCheck[i]['email'],
                      password: usersCheck[i]['password'],
                      firstName: usersCheck[i]['firstName'],
                      lastName: usersCheck[i]['lastName'],
                      type: usersCheck[i]['type'],
                    );
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) {
                        return HomeWidget(loggedInUser:loggedInUser,);
                      },
                    ));
                    return true;
                  }
                }

                return false;
              }

              return Scaffold(
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Color(0xFF0A0354),
                  child:SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                            child: Text(
                              'LOGIN',
                              textAlign: TextAlign.justify,
                              style:TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 55,
                                letterSpacing: 6,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: 350,
                              child: TextFormField(
                                style: const TextStyle(
                                    color:Colors.white,fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                                controller: email,
                                obscureText: false,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              width: 3, color: Colors.red)
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color:Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hoverColor: Colors.white,
                                      labelText: "Email", labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                      prefixIcon: Icon(Icons.alternate_email,color: Colors.white,)
                                  )
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: 350,
                              child: TextFormField(
                                style: const TextStyle(
                                    color:Colors.white,fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                                controller: password,
                                obscureText: true,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              width: 3, color: Colors.red)
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color:Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hoverColor: Colors.white,
                                      labelText: "Password", labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                      prefixIcon: Icon(Icons.lock,color: Colors.white,)
                                      ,suffixIcon: InkWell(onTap:(){

                                  },child: Icon(Icons.remove_red_eye,color: Colors.white,))
                                  )),
                                ),
                              ),
                            ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:Color(0xFFF4CC74),
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () async{
                              if (await checkLoginCreator()==false&&await checkLoginUser()==true) {
                              print("Login Successfully");

                              } else if(await checkLoginCreator()==true&&await checkLoginUser()==false) {
                              print("Login Successfully");
                              }
                              else{print("Error Login!");
                              _showSnackBar("EMAIL OR PASSWORD IS NOT VALID");
                              }

                            },
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 24,color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                TextButton(onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (c) {
                                      return SignupWidget();
                                    },
                                  ));
                                }, child: Text('Do you need an account?',style:TextStyle(color: Colors.white),))
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        )
    );
  }
}