import 'dart:math';

import 'package:faker/faker.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/model/vaccine_appointment.dart';

class FakeData {
  static List<Parent> generateParents(int count) {
    final faker = Faker();

    return List.generate(count, (index) {
      return Parent(
        faker.guid.guid(),
        faker.person.name(),
        faker.phoneNumber.us(),
        faker.address.streetAddress(),
      );
    });
  }

  static List<Child> generateChildren(List<Parent> parents, int count) {
    final faker = Faker();
    final random = Random();
    return List.generate(count, (index) {
      final parent = parents[random.nextInt(parents.length)];
      return Child(
        faker.guid.guid(),
        faker.person.firstName(),
        faker.date.time().toString(),
        parent.id,
      );
    });
  }

  static List<Vaccine> generateVaccines() {
    final faker = Faker();
    return [
      Vaccine(faker.guid.guid(), "BCG", "Tuberculosis", "At Birth"),
      Vaccine(faker.guid.guid(), "Hepatitis B", "Hepatitis B", "At Birth"),
      Vaccine(faker.guid.guid(), "OPV", "Polio", "6 weeks"),
      Vaccine(faker.guid.guid(), "Pentavalent", "DTP + HepB + Hib", "6 weeks"),
      Vaccine(faker.guid.guid(), "Measles", "Measles", "9 months"),
    ];
  }

  static List<Appointment> generateAppointments(
    List<Child> children,
    List<Vaccine> vaccines,
    int count,
  ) {
    final faker = Faker();
    final random = Random();
    return List.generate(count, (index) {
      final child = children[random.nextInt(children.length)];
      final vaccine = vaccines[random.nextInt(vaccines.length)];
      final dateTime =
          "2025-03-${random.nextInt(30) + 1} ${random.nextInt(8) + 8}:00";

      return Appointment(
        faker.guid.guid(),
        child.id,
        vaccine.id,
        dateTime,
      );
    });
  }
}
