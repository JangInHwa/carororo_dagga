import 'package:carororo_dagga/pages/home_page.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(
    GetMaterialApp(
      title: '카로로로 닦아!',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Gaegu',
      ),
    ),
  );
}
