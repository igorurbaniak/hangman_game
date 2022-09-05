import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TextStyle gamestyle = GoogleFonts.audiowide(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: NewGradientAppBar(
        gradient: const LinearGradient(
          colors: [
            Colors.cyan,
            Colors.red,
          ],
        ),
        centerTitle: true,
        title: Text(
          'Hangman',
          style: gamestyle,
        ),
        actions: [
          IconButton(
            iconSize: 35,
            onPressed: () {},
            icon: const Icon(
              Icons.volume_up_sharp,
            ),
          ),
        ],
      ),
    );
  }
}
