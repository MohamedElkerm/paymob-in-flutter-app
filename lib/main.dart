import 'package:flutter/material.dart';
import 'package:payment_integration/shared/network/my_dio.dart';
import 'package:payment_integration/start_point.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();


  runApp(const MyApp());
}

