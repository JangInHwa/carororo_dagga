import 'package:carororo_dagga/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const Button({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: backgroundColor, border: Border.all(color: borderColor), borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: foregroundColor),
            const SizedBox(width: 10),
            Text(text, style: TextStyle(fontSize: 24, color: foregroundColor)),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  Widget scoreBoard() {
    int score = Get.find<ScoreController>().score.value;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white54,
      ),
      padding: const EdgeInsets.only(left: 32, right: 32, top: 48, bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$score개의 용기를 카로로로 재활용하는 데에 성공했어요!',
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Button(
            text: '카로로 소개영상',
            onTap: () {
              try {
                launchUrl(Uri.parse('https://youtu.be/3foKcIzIRbo'), mode: LaunchMode.externalApplication);
              } catch (e) {}
            },
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            borderColor: Colors.black,
            icon: PhosphorIcons.play,
          ),
          const SizedBox(height: 16),
          Button(
            text: '홈으로',
            onTap: () => Get.back(),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            borderColor: Colors.black,
            icon: PhosphorIcons.house,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: scoreBoard(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
