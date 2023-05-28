import 'package:hive/hive.dart';

part 'hive_location.g.dart';

@HiveType(typeId: 0)
class LocationHevi extends HiveObject {
  @HiveField(0)
  String? userName;

  @HiveField(5)
  String? passWord;

  LocationHevi({this.userName, this.passWord});
}
