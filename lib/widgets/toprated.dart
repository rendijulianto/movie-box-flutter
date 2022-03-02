import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';
import 'package:movies_app/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modified_text(
                text: 'Top Rated Movies', size: 26, color: Colors.white),
            SizedBox(height: 10),
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: toprated.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () 
                      {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                      name: toprated[index]['title'] != null ? toprated[index]['title'] : "Not Loaded",
                                      description: toprated[index]['overview'] != null ? toprated[index]['overview'] : "Not Loaded",
                                      bannerurl: toprated[index]['poster_path'] != null ? "https://image.tmdb.org/t/p/w500"+toprated[index]['poster_path'] : "Not Loaded",
                                      posterurl: toprated[index]['backdrop_path'] != null ? "https://image.tmdb.org/t/p/w500"+toprated[index]['backdrop_path'] : "Not Loaded",
                                      vote: toprated[index]['vote_average'] != null ? toprated[index]['vote_average'].toString() : "Not Loaded",
                                      launch_on: toprated[index]['release_date'] != null ? toprated[index]['release_date'] : "Not Loaded",)));
                        },
                      child: toprated[index]['title'] != null ? Container(
                        width: 140, 
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(image: DecorationImage( 
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                  ),
                              )),
                            ),
                            Container(
                              child: modified_text(
                                  text: toprated[index]['title'] != null ? toprated[index]['title'] : 'Loading',
                                  size: 16,
                                  color: Colors.white),
                            ),
                          ]
                        ),
                      ) : Container(),
                    );
                  }),
            )
          ],
        ));
  }
}
