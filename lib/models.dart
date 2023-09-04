import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class MyCard extends StatelessWidget {
   String? text;
   Color? colour;
   MyCard({required this.text, required this.colour});

  @override

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        color: colour,
        child: Center(child: ListTile(

            title: Text(text!, style: GoogleFonts.ptSansNarrow(fontWeight: FontWeight.bold),))),
      ),
    );
  }

}

class Textt extends StatelessWidget {
  String? text;
 Textt({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text!, style: GoogleFonts.oswald(fontWeight: FontWeight.bold,fontSize: 15));
  }
}





