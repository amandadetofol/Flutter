import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_challenge/card.dart';

final class CardRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyCard(color: Colors.white),
              MyCard(
                color: Colors.pink,
                image: Icons.person_2,
              ),
              MyCard(color: Colors.lightBlue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyCard(color: Colors.red),
              MyCard(
                color: Colors.deepPurple,
                image: Icons.person_2,
              ),
              MyCard(color: Colors.blue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyCard(color: Colors.pinkAccent),
              MyCard(
                color: Colors.yellow,
                image: Icons.person_2,
              ),
              MyCard(color: Colors.lightBlue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyCard(color: Colors.purpleAccent),
              MyCard(
                color: Colors.white,
                image: Icons.person_2,
              ),
              MyCard(color: Colors.green),
            ],
          )
        ],
      ),
    );
  }
}
