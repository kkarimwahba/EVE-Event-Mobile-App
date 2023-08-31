import 'dart:ui';
import 'package:eve/bloc/userLogic.dart';
import 'package:eve/models/events.dart';
import 'package:eve/screens/pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
class EventDetails extends StatelessWidget
{
  late Events event;
  EventDetails({required this.event});
  @override
  Widget build(BuildContext context) {
    Future<void> createPdf() async {
      PdfDocument document = PdfDocument();
      final page= document.pages.add();
      double verticalPosition = 50.0;
      double lineHeight = 40.0;

      page.graphics.drawString('Thanks for purchasing Here is your Ticket!', PdfStandardFont(PdfFontFamily.helvetica, 20), bounds: Rect.fromLTWH(10, verticalPosition, page.getClientSize().width - 20, lineHeight));
      verticalPosition += lineHeight; // Move down for the next text

      PdfBitmap logoImage = PdfBitmap(await readImage('logo.png'));
      page.graphics.drawImage(logoImage, Rect.fromLTWH(100, 10, 250, 300));
      verticalPosition += 302;

      page.graphics.drawString('Title: ${event.title}.', PdfStandardFont(PdfFontFamily.helvetica, 30), bounds: Rect.fromLTWH(10, verticalPosition, page.getClientSize().width - 20, lineHeight));
      verticalPosition += lineHeight;

      page.graphics.drawString('Date: ${event.date}', PdfStandardFont(PdfFontFamily.helvetica, 30), bounds: Rect.fromLTWH(10, verticalPosition, page.getClientSize().width - 20, lineHeight));
      verticalPosition += lineHeight;

      page.graphics.drawString('Time: ${event.time}', PdfStandardFont(PdfFontFamily.helvetica, 30), bounds: Rect.fromLTWH(10, verticalPosition, page.getClientSize().width - 20, lineHeight));
      verticalPosition += lineHeight;

      page.graphics.drawString('Location: ${event.location}.', PdfStandardFont(PdfFontFamily.helvetica, 30), bounds: Rect.fromLTWH(10, verticalPosition, page.getClientSize().width - 20, lineHeight));
      verticalPosition += lineHeight;

      page.graphics.drawString('Price: ${event.image}EGP', PdfStandardFont(PdfFontFamily.helvetica, 30), bounds: Rect.fromLTWH(10, verticalPosition, page.getClientSize().width - 20, lineHeight));
      verticalPosition += lineHeight;
      page.graphics.drawString('Paying is on the gates.', PdfStandardFont(PdfFontFamily.helvetica, 15), bounds: Rect.fromLTWH(10, verticalPosition, page.getClientSize().width - 20, lineHeight));
      verticalPosition += lineHeight;

      List<int> bytes = await document.save();
      document.dispose();
      saveAndLaunchFile(bytes, 'ticket.pdf');
    }

    void drawTextAndIncrementPosition(PdfPage page, String text, double verticalPosition, double lineHeight) {
      page.graphics.drawString(text, PdfStandardFont(PdfFontFamily.helvetica, 30), bounds: Rect.fromLTWH(10, verticalPosition, page.getClientSize().width - 20, lineHeight));
      verticalPosition += lineHeight;
    }
UserLogic UserTable=UserLogic();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Text(
            event.title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
              color:Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .backgroundColor,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/bk.jpg',
            ),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              if(event.category=='Musical'||event.category=='musical')
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding:  EdgeInsets.only(top: 100,bottom: 10,left: 0,right: 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: SizedBox.fromSize(
                      child: Image.asset(
                        'assets/images/musical.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
              else if(event.category=='Stand-Up Comedy'||event.category=='stand up comedy')
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding:  EdgeInsets.only(top: 100,bottom: 10,left: 0,right: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: SizedBox.fromSize(
                        child: Image.asset(
                          'assets/images/comedy.jpg',
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                )
              else if(event.category=='gamimg'||event.category=='Gamimg'||event.category=='gaming'||event.category=='Gamimg')
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:  EdgeInsets.only(top: 100,bottom: 10,left: 0,right: 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: SizedBox.fromSize(
                            child: Image.asset(
                              'assets/images/event4.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
              else if(event.category!='gamimg'&&event.category!='Gamimg'&&event.category!='gaming'&&event.category!='Gamimg'&&event.category!='musical'&&event.category!='Stand-Up Comedy'&&event.category!='stand up comedy'&&event.category=='musical')
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:  EdgeInsets.only(top: 100,bottom: 10,left: 0,right: 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: SizedBox.fromSize(
                            child: Image.asset(
                              'assets/images/other.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  color:Color(0xFFE14658),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[ Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 16, 0, 0),
                      child: Text(
                        'Description :\n${event.description}. ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 16, 0, 0),
                    child: Text(
                     'Location :\n${event.location}.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color:Colors.black,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 16, 0, 0),
                          child: Text(
                            'Date :\n${event.date}.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color:Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 16, 0, 0),
                          child: Text(
                            'Time :\n${event.time}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color:Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 16, 0, 0),
                          child: Text(
                            'Category :\n${event.category}.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color:Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 16, 0, 0),
                          child: Text(
                            'Price :\n${event.image}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color:Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 16, 0, 0),
                    child: Text(
                      'Current : ${event.availability}. ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                          color:Colors.black
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: ElevatedButton(
                      child: Text('Book Now!',
                        style: TextStyle(
                        color: Color(0xFFE14658),fontSize: 20,
                      ),),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF4CC74),
                      ),
                      onPressed:createPdf
                    ),
                  )
                )
                ]  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}