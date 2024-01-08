import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(148, 151, 137, 137),
          ),
          //opacity: 0.2,
          //child: Image.asset(
          //  'assets/images/quiz-logo.png',
          //  width: 300,
          //),
          //),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Learn Flutter The Fun Way!',
            style: GoogleFonts.lato(
              color: Color.fromARGB(255, 236, 191, 216),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
