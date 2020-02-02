import 'package:flutter/material.dart';

// splash page items list

class SplashPageItems {
  Color color;
  String image;
  String title;
  String subTitle;

  SplashPageItems({this.color, this.image, this.title, this.subTitle});
}

List<SplashPageItems> splashItems = [
  // first page
  SplashPageItems(
    color: Colors.red,
    image: "https://cdn.dribbble.com/users/2983118/screenshots/9835817/media/d34b39a9aba93eb3c90d17dcf30ac4bf.gif",
    title: "It's First Splash Pages",
    subTitle: "First Description",
  ),

  // second page
  SplashPageItems(
    color: Colors.deepOrange,
    image: "https://cdn.dribbble.com/users/2983118/screenshots/9835817/media/d34b39a9aba93eb3c90d17dcf30ac4bf.gif",
    title: "It's Second Splash Pages",
    subTitle: "Second Description",
  ),

  // third page
  SplashPageItems(
    color: Colors.teal,
    image: "https://cdn.dribbble.com/users/2983118/screenshots/9835817/media/d34b39a9aba93eb3c90d17dcf30ac4bf.gif",
    title: "It's Third Splash Pages",
    subTitle: "Third Description",
  ),

  // fourth page
  SplashPageItems(
    color: Colors.indigo,
    image: "https://cdn.dribbble.com/users/2983118/screenshots/9835817/media/d34b39a9aba93eb3c90d17dcf30ac4bf.gif",
    title: "It's Fourth Splash Pages",
    subTitle: "Fourth Description",
  ),
];