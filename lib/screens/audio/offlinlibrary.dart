import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Beats/data/data.dart';
import 'package:Beats/screens/audio/offlineplayer.dart';

import '../home/home.dart';

class Offlinelibrary extends StatelessWidget {
  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black12,
      title: Text(
        "My Music",
        style: GoogleFonts.lato(),
      ),
      centerTitle: true,
    );
  }

  BottomAppBar bottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent.withOpacity(0.5),
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            iconSize: 28.0,
            tooltip: "Home",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            iconSize: 28.0,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            iconSize: 28.0,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            iconSize: 28.0,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      body: AudioBody(),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar(context),
    );
  }

  floatingActionButton() {}
}

class AudioBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 1000,
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: datas.length,
                  itemBuilder: (BuildContext context, int index) =>
                      BuildAudioCard(
                    data: datas[index],
                    itemIndex: index,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildAudioCard extends StatelessWidget {
  final int itemIndex;
  final Data data;

  const BuildAudioCard({
    Key key,
    this.itemIndex,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.black.withOpacity(0.5),
        child: InkWell(
          splashColor: Colors.green,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contex) => OfflinePlayer(
                data: datas[itemIndex],
              ),
            ),
          ),
          child: Container(
              width: 200,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      data.title,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    subtitle: Text(
                      data.artist,
                      style: GoogleFonts.lato(color: Colors.white54),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage(data.thumb),
                    radius: 55,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
