import 'package:hive/hive.dart';
part 'person.g.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String age;

  Person({required this.name, required this.age});
}
