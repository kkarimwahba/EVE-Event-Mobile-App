import 'package:eve/bloc/eventState.dart';
import 'package:eve/bloc/hallState.dart';
import 'package:eve/bloc/userState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
class HallLogic extends Cubit<HallState>{
  HallLogic() : super(HallCreate());

  late Database db;
  List<dynamic> hall=[];
  Future<void> createDatabase()async{
    db=await openDatabase(
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
        onOpen: (d) {
          print('Database opened');
          showData(d).then((value){
            hall=value;
            emit(HallShow());
          });
          print("open data show:${hall}");
          emit(HallCreate());
        });
  }
  insertData(String name,int capacity,String location,String type,String image) {
    db.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO hall (name,capacity,location,type,image)values("$name","$capacity","$location","$type","$image"")')
          .then((value) {
        print("ROW INSERTED $value");
      }).onError((error, stackTrace) {
        print('Error $error');
      });
    }).then((value) {
      emit(HallInsert());
    });
  }
  Future<List<Map<String, dynamic>>> showData(Database d) async {
    return await d.rawQuery('SELECT * FROM hall');
  }


}