import 'package:eve/bloc/eventState.dart';
import 'package:eve/models/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class EventLogic extends Cubit<EventState>{
  EventLogic() : super(EventCreate());

  late Database db;
  List<Events> EventsList=[];
  Future<void> createDatabase()async{
    openDatabase(
        'eve.db',
        version: 3,
        onCreate: (db,v){
          print('Database Created');
          db.execute('CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT,firstName TEXT,lastName TEXT,username TEXT,email TEXT, password TEXT,type TEXT,age INTEGER,phone TEXT,gender TEXT,event_attend TEXT)');
          print('table Created');
          db.execute('CREATE TABLE events(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,date TEXT,category TEXT,location TEXT,time TEXT,company_name TEXT,hall_name TEXT, hall_capacity INTEGER,image Text,booked_seats INTEGER,availability TEXT)');
          print("Table Events Created");
        },
        onUpgrade: (db, oldVersion, newVersion) {
          if (oldVersion == 2 && newVersion == 3) {
            // Perform schema changes from version 1 to version 2
            // For example, add the events table
            db.execute('CREATE TABLE hall(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,capacity INTEGER,location TEXT,type TEXT,image TEXT )');
            print("Table hall Created");
          }
        },
      onOpen: (d) async {
        print('Database opened');
        List<Map<String, dynamic>> eventData = await showData(d);
        EventsList = [];
        for (var data in EventsList) {
          EventsList = eventData.map((data) => Events.fromMap(data)).toList();
          // EventsList.add(eventData);
        }
        // EventsList = eventData.map((data) => Events.fromMap(data)).toList();
        emit(EventShow());
        print("open dataEvents show:");
      },
    ).then((value) {
      db = value;
      emit(EventCreate());
    });

  }
  InsertEvents(String title,String description,String date,String category,String location,String time,String companyName,int hallCapacity,String image,String bookedSeats,String availability){
    db.transaction((txn)async{
      txn.rawInsert('INSERT INTO events(title,description,date,category,location,time,company_name,hall_capacity,image,booked_seats,availability)values("$title","$description","$date","$category","$location","$time","$companyName","$hallCapacity","$image","$bookedSeats","$availability")'
      ).then((value) {
      print("EVENT INSERTED $value");
      }).onError((error, stackTrace) {
      print('Error $error');
      });
    }).then((value) {
      emit(EventInsert());
    });
  }
  Future<List<Map<String, dynamic>>> showData(Database d) async {
    return await d.rawQuery('SELECT * FROM events');
  }


}