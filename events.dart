class Events{
  late int id,hall_capacity,booked_seats;
  late String title,description,date,time,location,category,company_name,image,availability;
  Events({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.category,
    required this.company_name,
    required this.hall_capacity,
    required this.booked_seats,
    required this.image,
    required this.availability,
  });
  factory Events.fromMap(Map<String, dynamic> map) {
    return Events(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      location: map['location'] ?? '',
      category: map['category'] ?? '',
      company_name: map['company_name'] ?? '',
      hall_capacity: map['hall_capacity'] ?? 0,
      booked_seats: map['booked_seats'] ?? 0,
      image: map['image'] ?? '',
      availability: map['availability'] ?? '',
    );
  }


  @override
  String toString() {
    return 'User(id:$id,title: $title, description: $description,date:$date,time:$time,location:$location,category:$category,company_name:$company_name,hall_capacity:$hall_capacity,booked_Seats:$booked_seats,image:$image,availability:$availability))';
  }
}