
import 'package:api/common/colors.dart';
import 'package:api/common/constants.dart';
import 'package:api/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBlackColor,
      title: Image.asset(
        'assets/logo.png',
        height: 50,
        width: 120,
      ),
      actions:  [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const SearchScreen()));
          },
          child: const Icon(
            Icons.search,
            size: 30,
            color: kWhiteColor,
            )
            ),
            kWidth20,
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: Colors.blue,
                width: 30,
                height: 30,
              ),
            ),
            kWidth20
      ],
          );
  }
}