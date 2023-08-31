import 'package:sqflite/sqflite.dart';

class EventsDatabase{
late Database db;
List EventLst=[];
Future<void> createDatabase() async {
  db = await openDatabase(
      'eve.db',
      version: 6,
      onCreate: (db, v) {
        print('Database Created');
        db.execute(
            'CREATE TABLE USER (id integar primary key,username text,password text)');
        print('Table Created');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion == 5 && newVersion == 6) {
          // Perform schema changes from version 1 to version 2
          // For example, add the events table
          db.execute('CREATE TABLE Event(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,date TEXT,category TEXT,location TEXT,time TEXT,company_name TEXT, hall_capacity INTEGER,image Text,booked_seats INTEGER,availability TEXT)');
          print("Table Event Created");
        }
      },
      onOpen: (db) async {
        print('Database opened');
        EventLst=await displayData(db);
        print("EventEvE:${EventLst}");
      }
  );
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
displayData(Database d) async
{
  return await d.rawQuery('SELECT * FROM Event');
}
}