import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  static Box<T> openBox<T>(String name) => Hive.box<T>(name);
}
