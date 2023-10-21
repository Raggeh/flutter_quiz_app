import 'package:flutter/material.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/result.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Questions> questions = [
    Questions(q: 'Ahmed is certified Flutter Application Developer?', a: false),
    Questions(
        q: 'Flutter is the best framework Application Developer?', a: true),
    Questions(q: 'Flutter is not Open Source Framework?', a: false),
    Questions(q: 'Flutter was released in 2017?', a: true)
  ];

  int questionOfIndex = 0;

  int countCorrect = 0;
  int countWrong = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004b23),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  questions[questionOfIndex].questionName!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 22, right: 22),
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff38b000)),
                      onPressed: () {
                        final isCorrect = questions[questionOfIndex].answerName;

                        setState(() {
                          if (questionOfIndex < questions.length - 1) {
                            questionOfIndex++;
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Result(
                                    correctA: countCorrect, wrongA: countWrong),
                              ),
                            );
                          }
                        });

                        if (isCorrect == true) {
                          setState(() {
                            countCorrect = countCorrect + 1;
                          });
                        } else {
                          setState(() {
                            countWrong = countWrong + 1;
                          });
                        }
                      },
                      child: Text(
                        'True',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 22, right: 22, bottom: 30.0),
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffd62828)),
                      onPressed: () {
                        final isWrong = questions[questionOfIndex].answerName;
                      
                        setState(() {
                          if (questionOfIndex < questions.length - 1){
                            questionOfIndex++;
                           }
                            else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Result(
                                    correctA: countCorrect, wrongA: countWrong),
                              ),
                            );
                          }
                        }); 

                         if (isWrong == false) {
                          setState(() {
                              countCorrect = countCorrect + 1;
                          });} 
                            else {
                              setState(() {
                              countWrong = countWrong + 1;
                              });
                       }
                      },
                      child: Text(
                        'False',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
