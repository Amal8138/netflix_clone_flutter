
import 'package:api/models/top_series_model.dart';
import 'package:api/models/trending_movie_model.dart';
import 'package:api/models/upcoming_model.dart';
import 'package:api/screens/home/widgets/app_bar.dart';
import 'package:api/screens/home/widgets/trending_movie_card.dart';
import 'package:api/services/api_services.dart';
import 'package:api/widgets/custom_carousel.dart';
import 'package:api/screens/home/widgets/movie_card.dart';
import 'package:api/screens/home/widgets/now_playing_movie_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<UpcomingMovieModel> nowPlayingFuture;
  late Future<TopRatedSeriesModel> topRatedMovieSeries;
  late Future<TrendingMovieModel> trendingMovie;
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    upcomingFuture = apiServices.getUpcomingMovie(context);
    nowPlayingFuture = apiServices.getUpcomingMovie(context);
    topRatedMovieSeries = apiServices.getTopRatedMovieSeries(context);
    trendingMovie = apiServices.getTrendingMovie(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.only(top: 15),
      child: Scaffold(
        appBar:const PreferredSize(
          preferredSize:  Size.fromHeight(40), 
          child: AppBarHome()
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
               FutureBuilder(
                  future: topRatedMovieSeries,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
                      return const Text('No data available');
                    } else {
                      return CustomCarouselSliderWidget(data: snapshot.data!);
                    }
                  },
                ),
                SizedBox(
                  height: 220,
                  child: NowPlayingMovieCard(
                    future: nowPlayingFuture, 
                    headLineText: "Now Playing"
                    )),
                    SizedBox(
                  height: 220,
                  child: TrendingMovieCard(
                    future: trendingMovie, 
                    headLineText: "Trending Movie"
                    )),
                SizedBox(
                  height: 220,
                  child: MovieCardWidget(
                    future: upcomingFuture, 
                    headLineText: "Upcoming Movies"
                    )),
              ],
            ),
          )
      ),
    );
  }
}
