import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen,{super.key});

  final void Function() changeScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(103, 249, 249, 249),
          ),
          const SizedBox(height: 80),
          const Text('Learn Flutter the fun way!',
          style: TextStyle(color: Color.fromARGB(255, 248, 249, 251),
          fontSize: 24),
          ),
          OutlinedButton.icon(onPressed: changeScreen,
          style: OutlinedButton.styleFrom(foregroundColor:const Color.fromARGB(24, 249, 248, 248)),
           icon: const Icon(Icons.arrow_circle_right_outlined,color: Color.fromARGB(255, 254, 254, 254),),
           label: const Text("Start Quiz", style: TextStyle(color: Color.fromARGB(255, 253, 251, 251)),))
        ],
      ),
    );
  }
}
