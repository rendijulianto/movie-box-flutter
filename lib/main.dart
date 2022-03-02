import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/widgets/toprated.dart';
import 'package:movies_app/widgets/tranding.dart';
import 'package:movies_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.green));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trandingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apiKey = '190e4cff1377ee683cd88f35c0f7fa19';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOTBlNGNmZjEzNzdlZTY4M2NkODhmMzVjMGY3ZmExOSIsInN1YiI6IjYyMTViMmEyMWEzMjQ4MDA2YWJmNTYyZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pwekC5FuXW__6DPMZrMf4iyel-HR5jQ9ZkNbl-wZv1c';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trandingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    // print(trandingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 73, 73, 73),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(text: " Movie Box ❤️ ", size: 20, color: Colors.white,),
      ),
      body : ListView(
        children: [
          TopRatedMovies(toprated:topratedmovies),
          TrendingMovies(trending:trandingmovies),
          TVmovies(tv:tv)
        ]
      )
    );
  }
}
