import 'package:eve/bloc/eventState.dart';
import 'package:eve/bloc/userState.dart';
import 'package:eve/bloc/eventLogic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:eve/models/user.dart';
import 'package:eve/models/events.dart';

class UserLogic extends Cubit<UserState>{
  UserLogic() : super(UserCreate());
  User? loggedInUser;

  late Database db;
  List<User> users=[];
  List EventLst1=[];

  List<dynamic> eventsList=[];

Future<void> createDatabase()async{
    openDatabase(
      'eve.db',
       version: 6,
      onCreate: (db,v){
      print('Database Created');
      db.execute('CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT,firstName TEXT,lastName TEXT,username TEXT,email TEXT, password TEXT,type TEXT,age INTEGER,phone TEXT,gender TEXT,event_attend TEXT)');
      print('table Created');
      db.execute('CREATE TABLE events(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,date TEXT,category TEXT,location TEXT,time TEXT,company_name TEXT,hall_name TEXT, hall_capacity INTEGER,image Text,booked_seats INTEGER,availability TEXT)');
      print("Table Events Created");
      db.execute('CREATE TABLE hall(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,capacity INTEGER,location TEXT,type TEXT,image TEXT )');
      print("Table hall Created");
       },
       onUpgrade: (db, oldVersion, newVersion) {
    if (oldVersion == 5 && newVersion == 6) {
    db.execute('CREATE TABLE Event(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,date TEXT,category TEXT,location TEXT,time TEXT,company_name TEXT, hall_capacity INTEGER,image Text,booked_seats INTEGER,availability TEXT)');
    print("Table Event Created");
    }
       },
        onOpen: (d) async{
          print('Database opened');
          List<Map<String, dynamic>> userData = await showData(d);
          users = [];
          for (var data in userData) {
            User user = User.fromMap(data);
            users.add(user);
          }
          EventLogic eventLogic=EventLogic();
          emit(UserShow());
          print("open dataUsers show:${users}");
          List<Map<String, dynamic>> EventLst12 = await displayEvent(d);
          // EventLst1 = EventLst12.map((eventData) => Events.fromMap(eventData)).toList();
          // EventLst1=[];
          for(var eventData in EventLst12){
            Events eventss=Events.fromMap(eventData);
            EventLst1.add(eventss);
          }
          eventsList = EventLst1.map((event) => event.title).toList(); // Assuming 'title' is a property of the Events class
          // print("open dataEvents show:${eventLogic.EventsList}");
          emit(EventGet());
          print("open dataEvents show:${EventLst1}");

        }).then((value) {
      db = value;
      // You should populate the EventLst1 list here
      displayEvent(db).then((eventDataList) {
        EventLst1 = eventDataList.map((eventData) => Events.fromMap(eventData)).toList();
        emit(UserCreate());
      });
    });
  }
  insertData(String firstName,String lastName,String username,String email,String password,String type) {
    db.transaction((txn) async {
      txn.rawInsert(
        'INSERT INTO user (firstName,lastName,username,email,password,type)values("$firstName","$lastName","$username","$email","$password","$type")')
        .then((value) {
      print("ROW INSERTED $value");
      }).onError((error, stackTrace) {
      print('Error $error');
      });
    }).then((value) {
      emit(UserInsert());
    });
  }
  Future<List<Map<String,dynamic>>>showData(Database d) async {
    return await d.rawQuery('SELECT * FROM USER');
  }
  InsertEvents(String title,String description,String date,String category,String location,String time,String companyName,int hallCapacity,String image,int bookedSeats,String availability){
    db.transaction((txn)async{
      txn.rawInsert('INSERT INTO Event(title,description,date,category,location,time,company_name,hall_capacity,image,booked_seats,availability)values("$title","$description","$date","$category","$location","$time","$companyName","$hallCapacity","$image","$bookedSeats","$availability")'
      ).then((value) {
        print("EVENT INSERTED $value");
      }).onError((error, stackTrace) {
        print('Error $error');
      });
    });
  }
  displayEvent(Database d) async
  {
    return await d.rawQuery('SELECT * FROM Event');
  }
  // Future<List<Map<String, dynamic>>> showEvents(Database d) async {
  //   return await d.rawQuery('SELECT * FROM events');
  // }
  getData()async
  {
    List<Map<String, dynamic>> userData = await showData(db);
    users = [];
    for (var data in userData) {
      User user = User.fromMap(data);
      users.add(user);
    }
  }
}