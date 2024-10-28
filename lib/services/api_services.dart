import 'dart:convert';
import 'package:api/common/handle_http_error.dart';
import 'package:api/common/snack_bar.dart';
import 'package:api/common/utils.dart';
import 'package:api/models/movie_detai_modell.dart';
import 'package:api/models/recommended_movie_model.dart';
import 'package:api/models/search_models.dart';
import 'package:api/models/top_series_model.dart';
import 'package:api/models/trending_movie_model.dart';
import 'package:api/models/upcoming_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

late String endPoint;

class ApiServices {

  //upcoming movie
  Future<UpcomingMovieModel> getUpcomingMovie(BuildContext context) async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    try {
      final Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint("Success ${response.body}");
         debugPrint("upcoming $url");
        return UpcomingMovieModel.fromJson(jsonDecode(response.body));
      } else {
        handleHttpErrors(response.statusCode, context);
        throw Exception('Failed to load upcoming movies');
      }
    } catch (e) {
      debugPrint("Error $e");
      showSnackBarWidget(context, "Error occurred");
      return UpcomingMovieModel(
        // dates: Dates(
        //   maximum: DateTime.now(),
        //   minimum: DateTime.now(),
        // ),
        page: 1,
        results: [],
        totalPages: 0,
        totalResults: 0,
      );
    }
  }


  //now playing
  Future<UpcomingMovieModel> getNowPlayingMovies(BuildContext context) async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";

    try {
      final Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint("Success ${response.body}");
        debugPrint("now playing $url");
        return UpcomingMovieModel.fromJson(jsonDecode(response.body));
      } else {
        handleHttpErrors(response.statusCode, context);
        throw Exception('Failed to load now playing movies');
      }
    } catch (e) {
      debugPrint("Error $e");
      showSnackBarWidget(context, "Error occurred");
      return UpcomingMovieModel(
        // dates: Dates(
        //   maximum: DateTime.now(),
        //   minimum: DateTime.now(),
        // ),
        page: 1,
        results: [],
        totalPages: 0,
        totalResults: 0,
      );
    }
  }


  //top rated movie series
   Future<TopRatedSeriesModel> getTopRatedMovieSeries(BuildContext context) async {
    endPoint = "movie/top_rated";
    final url = "$baseUrl$endPoint$key";

    try {
      final Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint("Success ${response.body}");
        debugPrint("top_rated $url");
        return TopRatedSeriesModel.fromJson(jsonDecode(response.body));
      } else {
        handleHttpErrors(response.statusCode, context);
        throw Exception('Failed to load upcoming movies');
      }
    } catch (e) {
      debugPrint("Error $e");
      showSnackBarWidget(context, "Error occurred");
      return TopRatedSeriesModel(
        page: 1, 
        results: [], 
        totalPages: 0, 
        totalResults: 0
        );
    }
  }



  //trending movie
   Future<TrendingMovieModel> getTrendingMovie(BuildContext context) async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";

    try {
      final Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint("Success ${response.body}");
        debugPrint("top_rated $url");
        return TrendingMovieModel.fromJson(jsonDecode(response.body));
      } else {
        handleHttpErrors(response.statusCode, context);
        throw Exception('Failed to load upcoming movies');
      }
    } catch (e) {
      debugPrint("Error $e");
      showSnackBarWidget(context, "Error occurred");
      return TrendingMovieModel(
        page: 1, 
        results: [], 
        totalPages: 0, 
        totalResults: 0
        );
    }
  }


  //search 
   Future<SearchMovieModel> getSearchMovie(BuildContext context , String searchText) async {
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint";

    try {
      final Response response = await http.get(Uri.parse(url),
      headers: {
        'Authorization' : 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NjdkZmE1YTg3NDVhYWVmOTVmYjBhOGRmOTUxYzRkYyIsIm5iZiI6MTcyOTgzMTMzMy40OTYxMDIsInN1YiI6IjY0YzRjMmEwZWVjNWI1MDExY2IwMTk5NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xQcGdgRarQT-PAGb9qF0t2lR8dWDMiKuoxVzcQ973Ho'
      }
      );

      if (response.statusCode == 200) {
        debugPrint("Success ${response.body}");
        debugPrint("search_url $url");
        return SearchMovieModel.fromJson(jsonDecode(response.body));
      } else {
        handleHttpErrors(response.statusCode, context);
        throw Exception('Failed to load search movies');
      }
    } catch (e) {
      debugPrint("Error $e");
      //showSnackBarWidget(context, "Error occurred");
      return SearchMovieModel(
        page: 1, 
        results: [], 
        totalPages: 0, 
        totalResults: 0
        );
    }
  }


  //recomendation movie
  Future<RecommendedMovieModel> getMovieRecomendation(BuildContext context) async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";

    try {
      final Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint("Success ${response.body}");
        debugPrint("top_rated $url");
        return RecommendedMovieModel.fromJson(jsonDecode(response.body));
      } else {
        handleHttpErrors(response.statusCode, context);
        throw Exception('Failed to load recomendation movies');
      }
    } catch (e) {
      debugPrint("Error $e");
      showSnackBarWidget(context, "Error occurred");
      return RecommendedMovieModel(
        page: 1, 
        results: [], 
        totalPages: 0, 
        totalResults: 0
        );
    }
  }


  //movie detail
 Future<MovieDetailModel> getMovieDetails(int movieId) async {
    endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      debugPrint('success');
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }
}
