import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';
import 'package:movies_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modified_text(
                text: 'Trending Movies', size: 26, color: Colors.white),
            SizedBox(height: 10),
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: trending.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                      name: trending[index]['title'] != null ? trending[index]['title'] : "Loading",
                                      description: trending[index]['overview'] != null ? trending[index]['overview'] : "Loading",
                                      bannerurl: trending[index]['poster_path'] != null ? "https://image.tmdb.org/t/p/w500"+trending[index]['poster_path'] : "Loading",
                                      posterurl: trending[index]['backdrop_path'] != null ? "https://image.tmdb.org/t/p/w500"+trending[index]['backdrop_path'] : "Loading",
                                      vote: trending[index]['vote_average'] != null ? trending[index]['vote_average'].toString() : "Loading",
                                      launch_on: trending[index]['release_date'] != null ? trending[index]['release_date'] : "Loading",)));
                        },
                        child: 
                        trending[index]['title'] != null ? Container(
                          width: 140,
                          child: Column(children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path']),
                              )),
                            ),
                            Container(
                              child: modified_text(
                                  text: trending[index]['title'] != null
                                      ? trending[index]['title']
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
