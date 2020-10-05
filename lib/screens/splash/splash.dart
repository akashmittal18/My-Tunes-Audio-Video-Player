import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Beats/screens/home/home.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(200)),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/icons/ab.gif",
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: Text(
                    "MusicFlix",
                    style: GoogleFonts.lancelot(
                      color: Colors.white54,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.white.withOpacity(0.20),
                  child: Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 45.0,
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Made with ❤ By Akash Mittal",
                style: GoogleFonts.lato(
                  color: Colors.white54,
                  fontSize: 10.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
