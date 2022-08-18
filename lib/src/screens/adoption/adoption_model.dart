import 'package:simple_moment/simple_moment.dart';

class Adoption {

  late String adopteeID;
  late String name;
  late String age;
  late String gender;
  late String breed;
  late DateTime created;

  Adoption({
    this.adopteeID = '',
    this.name = '',
    this.gender = '',
    this.age = '',
    this.breed = '',
    DateTime? created,
  }) {
    created == null ? this.created = DateTime.now() : this.created = created;
  }



  Adoption.fromJson(Map<String, dynamic> json) {
    adopteeID = json['details'] ?? '';
    name = json['name'] ?? '';
    age = json['age'] ?? '';
    gender = json['gender'] ?? '';
    breed = json['breed'] ?? '';
    created = json['created'] ?? DateTime.now();
  }

  String get parsedDate {
    return Moment.fromDateTime(created).format('hh:mm a MMMM dd, yyyy ');
  }

  updateDetails(String newID, String newName, String newAge, String newGender, String newBreed) {
    adopteeID = newID;
    name = newName;
    age = newAge;
    gender = newGender;
    breed = newBreed;
    created = DateTime.now();
  }


  Map<String, dynamic> get json => {
    'details': adopteeID,
    'name' : name,
    'created': created,
    'age': age,
    'gender' : gender,
    'breed' : breed,
  };

  Map<String, dynamic> toJson() {
    return json;
  }

  log() {
    print(json);
  }

}