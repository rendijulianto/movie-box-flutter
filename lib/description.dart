import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container( 
        child: ListView(
          children: [
            Container( 
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container (
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl, fit: BoxFit.cover),
                  )), 
                  Positioned(bottom: 10,
                    child: modified_text(text: '⭐ Average Rating - '+vote, color: Colors.white, size: 18)),
                ]
              )
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(text: name, color: Colors.white, size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left:10),
              child: modified_text(text: "Releasing On - " + launch_on, color: Colors.white, size: 14),
            ),
           Row( 
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl, fit: BoxFit.cover),
                ),
                 Flexible(
                   child: Container(
                      child: modified_text(text: "Description : "+  description, color: Colors.white, size: 18),
                                 ),
                 )
              ]
           )
          ]
        ),
      ),
    );
  }
}
