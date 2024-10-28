import 'package:api/common/constants.dart';
import 'package:api/common/utils.dart';
import 'package:api/models/trending_movie_model.dart';
import 'package:flutter/material.dart';

class TrendingMovieCard extends StatelessWidget {
  final Future<TrendingMovieModel> future;
  final String headLineText;
  const TrendingMovieCard ({super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future, 
    builder: (context , snapshot){
      if(snapshot.hasData){
      var data = snapshot.data?.results;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(headLineText,
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
          kHeight10,
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data?.length,
              itemBuilder: (context , index){
              return Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Image.network("$imageUrl${data?[index].posterPath}"),
              );
            }),
          )
        ],  
      );
      }
      else {
        return const SizedBox.shrink();
      }
    });
  }
}