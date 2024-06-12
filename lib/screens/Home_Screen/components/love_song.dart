import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../provider/music_provider.dart';
import '../../../utils/audio_list.dart';
import '../../../utils/img_list.dart';

Column loveSong(MusicProvider providerTrue, MusicProvider providerFalse, BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              "Love Song",
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
          providerFalse.changeIndex(index);

          providerFalse.assetsAudioPlayer!.open(audio);

          Navigator.of(context).pushNamed('/song3',arguments: Img3[index]);


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
  );
}
