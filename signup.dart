import 'package:eve/bloc/userLogic.dart';
import 'package:eve/bloc/userState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.dart';

class SignupWidget extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController lastname = TextEditingController();



  @override
  Widget build(BuildContext context) {
    void _showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor:Color(0xFFE14053),

      ));
    }
    bool _isValidEmail(String email) {
      return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email);
    }
List<String> typeOfUser=["Creator","User"];
    String SelectedUser='';
    bool _isValidPassword(String password) {
      return password.length >= 8; // You can adjust the minimum length as needed
    }

    return BlocProvider(create: (context) => UserLogic()..createDatabase(),
    child: BlocConsumer<UserLogic, UserState>(
    listener: (context, state) {},
    builder: (context, state) {
    UserLogic userTable = BlocProvider.of(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return  Scaffold(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0xFF0A0354),
              ),
              child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32, 32, 32, 32),
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  width: 300,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                'Create an account',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontFamily: 'Poppings',
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: firstname,
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
                                      labelText: "First Name", labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: lastname,
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
                                    labelText: "Last Name", labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: email,
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
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: username,
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
                                    labelText: "Username", labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  controller: password,
                                  obscureText: true,
                                  style: TextStyle(color: Colors.white),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: type,
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
                                      labelText: "Role of Users", labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  )),
                            ),
                            // DropdownButtonFormField<String>(
                            //   dropdownColor: Colors.black,
                            //   style: const TextStyle(
                            //       color:Colors.white),
                            //   value: typeOfUser[0],
                            //   onChanged: (newValue) {
                            //     type.text = newValue!;
                            //   },
                            //   icon: Icon(
                            //     Icons.arrow_drop_down,
                            //     color: Colors.white,
                            //   ),
                            //   items: typeOfUser.map((role) {
                            //     return DropdownMenuItem<String>(
                            //       value: role,
                            //       child: Text(role),
                            //     );
                            //   }).toList(),
                            //   decoration: InputDecoration(
                            //     labelText: 'Select User Role',
                            //     labelStyle: TextStyle(
                            //       color: Colors.white),
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(50),
                            //         borderSide: BorderSide(
                            //             width: 0, color: Colors.red)
                            //     ),
                            //     hintStyle: TextStyle(
                            //       fontFamily: 'Readex Pro',
                            //       color:Colors.white,
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.normal,
                            //     ),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Colors.white,
                            //         width: 2,
                            //       ),
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Colors.white,
                            //         width: 2,
                            //       ),
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     errorBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Colors.white,
                            //         width: 2,
                            //       ),
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     focusedErrorBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Colors.white,
                            //         width: 2,
                            //       ),
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     hoverColor: Colors.white,
                            //   ),
                            //   ),
                             Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: ElevatedButton(
                                onPressed: () {
                                  print('Button pressed ...');
                                  if(firstname.text.isNotEmpty&&lastname.text.isNotEmpty&&email.text.isNotEmpty&&password.text.isNotEmpty&&username.text.isNotEmpty&&type.text.isNotEmpty) {
                                      if(_isValidEmail(email.text)&&_isValidPassword(password.text)) {
                                        userTable.insertData(
                                            firstname.text, lastname.text,
                                            username.text, email.text,
                                            password.text, type.text);
                                        firstname.text='';
                                        lastname.text='';
                                        email.text='';
                                        password.text='';
                                        username.text='';
                                        type.text='';
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (c) {
                                              return Login();
                                            }));
                                      }
                                      else
                                        {
                                          _showSnackBar('Please enter a password needs to be more than 8 characters.');

                                        }
                                  }
                                  else
                                    {
                                      _showSnackBar('Please enter your data Correctly .');
                                    }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFF4CC74),
                                  onPrimary: Color(0xFF0A0354),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(
                                      color: Color(0xFF0A0354),
                                      width: 2,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  minimumSize: Size(370, 44), // Maintain width and height
                                ),
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0A0354),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ])
                  )
              ),
            ),
          ),
        ),
    );
    }
    )
    );
  }
}
