import 'package:carororo_dagga/pages/game_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.to(GamePage()),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Carororo Dagga!', style: TextStyle(fontSize: 40)),
                  const SizedBox(height: 8),
                  const Text('카로로로 닦아!', style: TextStyle(fontSize: 28)),
                  const SizedBox(height: 24),
                  Image.asset('assets/images/with_caroro.png'),
                  const SizedBox(height: 80),
                  const Text('탭해서 시작하기', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
