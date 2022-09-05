import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: NewGradientAppBar(
        gradient: const LinearGradient(
          colors: [Colors.cyan, Colors.red],
        ),
        centerTitle: true,
        title: Text(
          'Hangman',
          style: GoogleFonts.audiowide(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            iconSize: 35,
            onPressed: () {},
            icon: const Icon(Icons.volume_up_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: Colors.lightBlue),
                width: MediaQuery.of(context).size.width / 3.5,
                height: 30,
                child: Center(
                  child: Text(
                    '25 points',
                    style: GoogleFonts.audiowide(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Image(
                image: AssetImage('images/hangman10.png'),
                width: 155,
                height: 155,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '7 lives left',
                style: GoogleFonts.audiowide(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
