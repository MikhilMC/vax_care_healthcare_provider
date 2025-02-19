class Parent {
  final String id;
  final String name;
  final String contact;
  final String address;

  Parent(this.id, this.name, this.contact, this.address);
}

class Child {
  final String id;
  final String name;
  final String dob;
  final String parentId;

  Child(this.id, this.name, this.dob, this.parentId);
}

class Vaccine {
  final String id;
  final String name;
  final String disease;
  final String recommendedAge;

  Vaccine(this.id, this.name, this.disease, this.recommendedAge);
}

class Appointment {
  final String id;
  final String childId;
  final String vaccineId;
  final String dateTime;

  Appointment(this.id, this.childId, this.vaccineId, this.dateTime);
}
