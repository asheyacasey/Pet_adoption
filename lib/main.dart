import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('pets');
  await Hive.openBox('accounts');
  await Hive.openBox('auto_login_user');

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}


