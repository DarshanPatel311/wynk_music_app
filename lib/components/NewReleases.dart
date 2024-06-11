import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wynk_music_app/screens/song_screen.dart';

import '../provider/music_provider.dart';
import '../utils/audio_list.dart';
import '../utils/img_list.dart';

class NewReels extends StatelessWidget {
  const NewReels({
    super.key,
    final int? index,
  });

  @override
  Widget build(BuildContext context) {
    MusicProvider providerTrue =
    Provider.of<MusicProvider>(context, listen: true);
    MusicProvider providerFalse =
    Provider.of<MusicProvider>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15,left: 20),
          child: Row(
            children: [
              Text("New Releases",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 1,
              ),),
              Spacer(),
              Text("See all",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),)
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(

            children: [
              SizedBox(width: 10,),
              ...List.generate(Img2.length, (index) =>
                  Row(

                    children: [

                      CupertinoButton(
                        onPressed: () {
                          providerTrue.isplay=false;
                          Audio audio = audioList2[index];

                          providerFalse.assetsAudioPlayer!.open(audio);

                          Navigator.of(context).pushNamed('/song',arguments: Img2[index]);



                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: AssetImage(Img2[index]['img']),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(Img2[index]['name'], style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),),
                          ],
                        ),
                      ),


                    ],
                  ),),
            ],
          ),
        ),
      ],
    );
  }
}