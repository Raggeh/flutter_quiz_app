import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key , required this.correctA , required this.wrongA});


  final int correctA ;
  final int wrongA ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff132a13),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$correctA Correct Answer (s)',
            style: TextStyle(color: Colors.white, 
            fontSize: 25),
            ),
            SizedBox(height: 15,),
            Text('$wrongA Wrong Answer (s)' ,
            style: TextStyle(fontSize: 20,
            color: Colors.white,
            ),
            )
          ],
        ),
      ),
    );
  }
}