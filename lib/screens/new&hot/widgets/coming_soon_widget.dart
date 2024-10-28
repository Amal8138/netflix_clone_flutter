import 'package:api/common/colors.dart';
import 'package:api/common/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComingSoonMovieWidget extends StatelessWidget {
  final String imageUrl;
  final String overview;
  final String logoUrl;
  final String month;
  final String day;
  const ComingSoonMovieWidget({super.key, required this.imageUrl, required this.overview, required this.logoUrl, required this.month, required this.day});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              kHeight10,
              Text(month,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
                Text(day,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 5,
                ),
                ),
            ],
          ),
          kWidth10,
          Expanded(child: Column(
            children: [
              CachedNetworkImage(imageUrl: imageUrl),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                    height: size.height * 0.2,
                    child: CachedNetworkImage(
                      imageUrl: logoUrl,
                      alignment: Alignment.centerLeft,
                      ),
                  ),
                  const Spacer(),
                  const Column(
                    children: [
                      Icon(Icons.notifications_none_rounded,
                      size: 25,
                      color: kWhiteColor,
                      ),
                      
                    ],
                  ),
                  kWidth20,
                  const Column(
                    children: [
                      Icon(Icons.info,
                      size: 25,
                      color: kWhiteColor,
                      ),
                      
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Coming on $month $day"),
                  kHeight10,
                  Text(
                    maxLines: 3,
                    overview,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}