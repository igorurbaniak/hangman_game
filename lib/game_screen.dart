import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hangman_game/utils.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String word = wordslist[Random().nextInt(wordslist.length)];
  List guessedalphabets = [];
  int points = 0;
  int status = 0;
  List images = [
    'images/hangman0.png',
    'images/hangman1.png',
    'images/hangman2.png',
    'images/hangman3.png',
    'images/hangman4.png',
    'images/hangman5.png',
    'images/hangman6.png',
  ];

  String riddletext() {
    String displayword = '';
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (guessedalphabets.contains(char)) {
        displayword += '$char ';
      } else {
        displayword += '? ';
      }
    }
    return displayword;
  }

  checkalphabet(String alphabet) {
    if (word.contains(alphabet)) {
      setState(
        () {
          guessedalphabets.add(alphabet);
          points += 5;
        },
      );
    } else if (status != 6) {
      setState(
        () {
          status += 1;
          points -= 5;
        },
      );
    } else {
      print('You lost');
    }

    bool isWon = true;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!guessedalphabets.contains(char)) {
        setState(
          () {
            isWon = false;
          },
        );
        break;
      }
    }
    if (isWon) {
      print('Won');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: NewGradientAppBar(
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.blueAccent],
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
        physics: const ScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.purple, Colors.blueAccent])),
                width: MediaQuery.of(context).size.width / 3.5,
                height: 30,
                child: Center(
                  child: Text(
                    '$points points',
                    style: GoogleFonts.audiowide(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Image(
                image: AssetImage(images[status]),
                width: 220,
                height: 220,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '${7 - status} lives left',
                style: GoogleFonts.audiowide(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                riddletext(),
                textAlign: TextAlign.center,
                style: GoogleFonts.audiowide(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.blueAccent],
                  ),
                ),
                child: GridView.count(
                  // mainAxisSpacing: 3,
                  // crossAxisSpacing: 3,
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.2,
                  children: letters.map(
                    (alphabet) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            checkalphabet(alphabet);
                          });
                        },
                        child: Center(
                          child: Text(
                            alphabet,
                            style: GoogleFonts.audiowide(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
