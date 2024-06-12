import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/music_provider.dart';
import '../../../utils/audio_list.dart';
import '../../../utils/img_list.dart';

class TopSearches extends StatelessWidget {
  const TopSearches({
    super.key,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(

            children: [
              SizedBox(width: 10,),

              ...List.generate(Img.length, (index) =>
                  Row(

                    children: [

                      CupertinoButton(
                        onPressed: () {
                          Audio audio = audioList[index];
                          providerTrue.isplay=false;
                          providerFalse.assetsAudioPlayer!.open(audio);
                          providerFalse.changeIndex(index);

                          Navigator.of(context).pushNamed('/song',arguments: Img[index]);
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
                                      image: AssetImage(Img[index]['img']),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(Img[index]['name'], style: TextStyle(
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
