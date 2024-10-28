import 'package:api/common/constants.dart';
import 'package:api/common/utils.dart';
import 'package:api/models/top_series_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSliderWidget extends StatelessWidget {
  final TopRatedSeriesModel data;
  const CustomCarouselSliderWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.results.length, 
        itemBuilder: (BuildContext context , int index , int realIndex){
          var url = data.results[index].backdropPath.toString();
          debugPrint("image url = $imageUrl$url");
          return GestureDetector(
            child: Column(
              children: [
                Image.network("$imageUrl$url"),
                kHeight20,
                Text(data.results[index].originalTitle)
              ],
            )
            );
        }, 
        options: CarouselOptions(
          height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
          aspectRatio: 16/9,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal
        )
        ),
    );
  }
}