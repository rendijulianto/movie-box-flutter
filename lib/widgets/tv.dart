import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';
import 'package:movies_app/utils/text.dart';

class TVmovies extends StatelessWidget {
  final List tv;

  const TVmovies({Key? key, required this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modified_text(
                text: 'Popular TV Movies', size: 26, color: Colors.white),
            SizedBox(height: 10),
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: tv.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                      name: tv[index]['original_name'] != null ? tv[index]['original_name'] : "Loading",
                                      description: tv[index]['overview'] != null ? tv[index]['overview'] : "Loading",
                                      bannerurl: tv[index]['poster_path'] != null ? "https://image.tmdb.org/t/p/w500"+tv[index]['poster_path'] : "Loading",
                                      posterurl: tv[index]['backdrop_path'] != null ? "https://image.tmdb.org/t/p/w500"+tv[index]['backdrop_path'] : "Loading",
                                      vote: tv[index]['vote_average'] != null ? tv[index]['vote_average'].toString() : "Loading",
                                      launch_on: tv[index]['release_date'] != null ? tv[index]['release_date'] : "Loading",)));
                        },
                        child: 
                        tv[index]['original_name'] != null ? Container(
                          width: 140,
                          child: Column(children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        tv[index]['poster_path']),
                              )),
                            ),
                            Container(
                              child: modified_text(
                                  text: tv[index]['original_name'] != null
                                      ? tv[index]['original_name']
                                      : 'Loading',
                                  size: 16,
                                  color: Colors.white),
                            ),
                          ]),
                        ): Container(),
                        );
                  }),
            )
          ],
        ));
  }
}
