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

  opendialog(String title) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blueAccent],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.audiowide(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  'Your points: $points',
                  style: GoogleFonts.audiowide(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        status = 0;
                        guessedalphabets.clear();
                        points = 0;
                        word = wordslist[Random().nextInt(wordslist.length)];
                      });
                    },
                    child: Center(
                      child: Text(
                        'PLAY AGAIN !',
                        style: GoogleFonts.audiowide(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

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
      opendialog('You lost 😥');
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
      opendialog('Hurray, you won!👏');
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
            onPressed: () {
              setState(() {
                status = 0;
                guessedalphabets.clear();
                points = 0;
                word = wordslist[Random().nextInt(wordslist.length)];
              });
            },
            icon: const Icon(
              Icons.restart_alt_sharp,
              color: Colors.white,
            ),
            iconSize: 35,
          )
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
                      colors: [Colors.purple, Colors.blueAccent]),
                ),
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
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
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
