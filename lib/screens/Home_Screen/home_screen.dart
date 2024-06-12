
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'components/NewReleases.dart';
import 'components/TopSearches.dart';
import 'components/bootom_navigation.dart';
import 'components/carouselslider.dart';
import 'components/love_song.dart';
import '../../provider/music_provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MusicProvider providerTrue =
    Provider.of<MusicProvider>(context, listen: true);
    MusicProvider providerFalse =
    Provider.of<MusicProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 250,
                          color: Colors.white,
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 70,
                    width: 200,
                    child: Image.asset(
                      'assets/img/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_rounded,
                      size: 35,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 35,
                      color: Colors.white,
                    )),
              ],
            ),
            Container(
              height: 100,
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/img/poster.jpg"),
                      fit: BoxFit.cover)),
            ),
            Text(
              "ADVERTISEMENT",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5),
            ),
            CarouselSliderBox(),

            TopSearches(),
            NewReels(),
            loveSong(providerTrue, providerFalse, context),
           ]
      ),
      ),
      bottomNavigationBar: bottomNavigation(providerFalse, providerTrue),
    );


  }




}




