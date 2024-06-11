import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wynk_music_app/screens/song_screen.dart';

import '../components/NewReleases.dart';
import '../components/TopSearches.dart';
import '../provider/music_provider.dart';
import '../utils/audio_list.dart';
import '../utils/img_list.dart';

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
            Container(
              height: 120,
              width: double.infinity,
              margin: EdgeInsets.all(25),
              color: Colors.white,
            ),
            TopSearches(),
            NewReels(),


            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Top Searches",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 23,
                            letterSpacing: 1),
                      )
                    ],
                  ),
                ),

                ...List.generate(Img3.length, (index) =>  CupertinoButton(
                  onPressed: () {
                    providerTrue.isplay=false;
                    Audio audio = audioList3[index];

                    providerFalse.assetsAudioPlayer!.open(audio);

                    Navigator.of(context).pushNamed('/song',arguments: Img3[index]);


                  },

                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,),
                    child: Row(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(Img3[index]['img']),
                                  fit: BoxFit.cover

                              ),

                            )

                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Img3[index]['name1'],style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15

                            ),),
                            Text(Img3[index]['name'],style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            ),),

                          ],
                        ),
                        Spacer(),
                        Icon(Icons.more_vert_outlined,color: Colors.white,size: 30,)
                      ],
                    ),
                  ),
                ),)

              ],
            ),
           ]
      ),
      ),
      bottomNavigationBar: ConvexAppBar(

        backgroundColor: Colors.black,

        style: TabStyle.fixedCircle,
        activeColor: Colors.pink,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.music_video, title: 'My Music'),
          (providerFalse.isplay)?TabItem(icon: Icons.play_arrow_outlined, title: 'Song',):TabItem(icon: Icons.pause_circle, title: 'Song',isIconBlend: providerTrue.isplay),
          TabItem(icon: Icons.queue_music, title: 'Hellotunes'),
          TabItem(icon: Icons.people, title: 'Profile'),

        ],
        onTap: (int i) {i++;
        HomeScreen();
        SongScreen();
        },


      ),
    );


  }
}




