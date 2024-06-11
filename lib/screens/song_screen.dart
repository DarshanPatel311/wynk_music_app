import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wynk_music_app/screens/home_screen.dart';


import '../provider/music_provider.dart';
import '../utils/img_list.dart';


class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {


  @override
  void initState() {
    super.initState();
    // Initialize the player and open the audio file
    Future.delayed(Duration.zero, () {
      Provider.of<MusicProvider>(context, listen: false).initializePlayer();
    });
  }

  @override
  Widget build(BuildContext context) {
    MusicProvider providerTrue =
        Provider.of<MusicProvider>(context, listen: true);
    MusicProvider providerFalse =
        Provider.of<MusicProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.mirror,
                colors: [
              Colors.redAccent,
              Colors.black,
              Colors.black,
            ])),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 25,
                    )),
                Text(
                  "RECOMMENDED FOR YOU",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_sharp,
                      color: Colors.white,
                      size: 25,
                    )),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Img[providerTrue.currentIndex]['img']),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 20, right: 10, top: 50),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Animal Love Song",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: Colors.grey.shade300,
                          ),
                          Text(
                            "Gaman Santhal",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade300),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle_outline_outlined,
                        color: Colors.white,
                        size: 32,
                      )),
                ],
              ),
            ),
            Slider(
              value: providerTrue.sliderValue,
              max: providerTrue.maxDuration > 0
                  ? providerTrue.maxDuration
                  : 1.0,
              onChanged: (value) {
                if (providerTrue.maxDuration > 0) {
                  providerTrue.seek(value);
                }
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.repeat_one_outlined,
                  color: Colors.green,
                  size: 35,
                ),
                SizedBox(),
                IconButton(
                  onPressed: () {
                    providerTrue.assetsAudioPlayer!.previous();
                    providerFalse.playPreviousSong();

                  },
                  icon: Icon(
                    Icons.fast_rewind,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                (providerFalse.isplay)?
                IconButton(
                  onPressed: () {
                    providerFalse.assetsAudioPlayer!.play();

                    providerTrue.songplay();
                  },
                  icon: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 75,
                  ),
                ) :IconButton(
                  onPressed: () {
                   setState(() {
                     providerFalse.assetsAudioPlayer!.pause();

                     providerTrue.songplay();
                   });
                  },
                  icon: Icon(
                    Icons.pause_circle,
                    color: Colors.white,
                    size: 75,
                  ),
                )
               ,
                IconButton(
                  onPressed: () {




                  },
                  icon: Icon(
                    Icons.fast_forward_sharp,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                SizedBox(),
                Icon(
                  Icons.timer_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: () {

                }, icon: Icon(Icons.connected_tv,size: 25,color: Colors.white,)),
                Spacer(),
                IconButton(onPressed: () {

                }, icon: Icon(Icons.share,size: 25,color: Colors.white,))
              ],
            )
          ],
        ),
      ),
    );
  }
}


