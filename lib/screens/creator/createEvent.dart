import 'package:eve/bloc/eventLogic.dart';
import 'package:eve/bloc/eventState.dart';
import 'package:eve/bloc/userLogic.dart';
import 'package:eve/bloc/userState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CreateEvent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocProvider(create: (context)=>UserLogic()..createDatabase()
   ,child: BlocConsumer<UserLogic,UserState>(
       listener: (context,state){},
       builder: (context,state){
          UserLogic userTable =BlocProvider.of(context);
          TextEditingController title=TextEditingController();
          TextEditingController description=TextEditingController();
          TextEditingController date=TextEditingController();
          TextEditingController time=TextEditingController();
          TextEditingController location=TextEditingController();
          TextEditingController category=TextEditingController();
          TextEditingController CompanyName=TextEditingController();
          TextEditingController hallName=TextEditingController();
          TextEditingController priceOfTicket=TextEditingController();
          TextEditingController hallCapacity=TextEditingController();
          TextEditingController image=TextEditingController();
          TextEditingController availability=TextEditingController();
          void _showSnackBar(String message) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
              duration: Duration(seconds: 3),
              backgroundColor:Color(0xFFE14053),
            ));
          }
          return Scaffold(
            body: Container(
              color: Color(0xFF0A0354),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                        child: Text(
                          'CREATE AN EVENT',
                          textAlign: TextAlign.justify,
                          style:TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 35,
                            letterSpacing: 6,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: const TextStyle(
                                color:Colors.white,fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            controller: title,
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
                                labelText: "Event Name",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                hintText: "Enter Event's name",

                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: const TextStyle(
                                color:Colors.white,fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            controller: description,
                            decoration: InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.red)
                                ),hintStyle: TextStyle(
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
                                labelText: "Description", labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                                hintText: "Enter Event's Description",
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: const TextStyle(
                                color:Colors.white,fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            controller: date,
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
                                labelText: "Date", labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                                hintText: "Enter Event's Date",
                                prefixIcon: Icon(Icons.date_range,color: Colors.white)
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: const TextStyle(
                                color:Colors.white,fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            controller: time,
                            decoration: InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.red)
                                ),hintStyle: TextStyle(
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
                                labelText: "Time",
                                hintText: "Enter Event's time", labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                                prefixIcon: Icon(Icons.access_time_outlined,color: Colors.white)
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: const TextStyle(
                                color:Colors.white,fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            controller: location,
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
                                labelText: "Location", labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                                hintText: "Enter Event's location",
                                prefixIcon: Icon(Icons.location_on_sharp,color: Colors.white,)
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: const TextStyle(
                                color:Colors.white,fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            controller: category,
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
                                labelText: "Category", labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                                hintText: "Enter Event's category",
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: const TextStyle(
                                color:Colors.white,fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            controller: priceOfTicket,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.red)
                              ),hintStyle: TextStyle(
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
                              labelText: "Ticket Price", labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                              hintText: "Enter ticket's price",
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: const TextStyle(
                                color:Colors.white,fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            controller: CompanyName,
                            decoration: InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.red)
                                ),hintStyle: TextStyle(
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
                                labelText: "Company Name", labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                                hintText: "Enter your company name",
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: const TextStyle(
                                color:Colors.white,fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            controller: hallCapacity,
                            decoration: InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.red)
                                ),hintStyle: TextStyle(
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
                                labelText: "Capacity", labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                                hintText: "Enter Event's capacity",
                            )),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: TextFormField(
                      //       style: const TextStyle(
                      //           color:Colors.white,fontFamily: 'Poppins',
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.normal),
                      //       controller: image,
                      //       decoration: InputDecoration(
                      //           focusColor: Colors.white,
                      //           fillColor: Colors.white,
                      //           border: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(50),
                      //               borderSide: BorderSide(
                      //                   width: 3, color: Colors.red)
                      //           ),hintStyle: TextStyle(
                      //         fontFamily: 'Readex Pro',
                      //         color:Colors.white,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.normal,
                      //       ),
                      //         enabledBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(
                      //             color: Colors.white,
                      //             width: 2,
                      //           ),
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         focusedBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(
                      //             color: Colors.white,
                      //             width: 2,
                      //           ),
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         errorBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(
                      //             color: Colors.white,
                      //             width: 2,
                      //           ),
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         focusedErrorBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(
                      //             color: Colors.white,
                      //             width: 2,
                      //           ),
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //           hoverColor: Colors.white,
                      //           labelText: "Image", labelStyle: TextStyle(
                      //         color: Colors.white,
                      //       ),
                      //           hintText: "Enter The event image",
                      //       )),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: const TextStyle(
                                color:Colors.white,fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            controller: availability,
                            decoration: InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.red)
                                ),hintStyle: TextStyle(
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
                                labelText: "Availability", labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                                hintText: "Enter the condition",
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:Color(0xFFF4CC74),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () async{
                            userTable.InsertEvents(title.text,description.text,date.text,category.text,location.text,time.text,CompanyName.text,int.parse(hallCapacity.text),priceOfTicket.text,0,availability.text);
                            _showSnackBar("Created Successfully");
                            title.text='';
                           time.text='';
                           date.text='';
                           location.text='';
                           category.text='';
                           description.text='';
                           image.text='';
                           priceOfTicket.text='';
                           hallCapacity.text='';
                           availability.text='';
                           CompanyName.text='';
                            },
                          child: const Text(
                            'CREATE',
                            style: TextStyle(fontSize: 24,color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
          );
       },
     ),
   );
  }
  
}