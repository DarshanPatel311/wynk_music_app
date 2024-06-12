import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CarouselSlider CarouselSliderBox() {
  return CarouselSlider(
    options: CarouselOptions(
      height: 180,
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,

      scrollDirection: Axis.vertical,
    ),

    items: [
      Container(

        width: double.infinity,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(

                image: AssetImage("assets/img/poster1.jpg"),
                fit: BoxFit.cover
            )
        ),
      ),
      Container(

        width: double.infinity,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(

                image: AssetImage("assets/img/poster2.jpg"),
                fit: BoxFit.cover
            )
        ),
      ),
      Container(

        width: double.infinity,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(

                image: AssetImage("assets/img/poster3.jpg"),
                fit: BoxFit.cover
            )
        ),
      ),

    ],

  );
}