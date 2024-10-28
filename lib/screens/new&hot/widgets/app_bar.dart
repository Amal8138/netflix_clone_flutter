import 'package:api/common/colors.dart';
import 'package:api/common/constants.dart';
import 'package:flutter/material.dart';

class HotAndNewAppBar extends StatelessWidget {
  const HotAndNewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBlackColor,
      title: const Text("New & Hot",
      style: TextStyle(
        color: kWhiteColor
      ),
      ),
      actions: [
        const Icon(Icons.cast,
        color: kWhiteColor,
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
      kWidth20,
      ],
      bottom:  TabBar(
        unselectedLabelColor: kWhiteColor,
        dividerColor: kBlackColor,
        isScrollable: false,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kWhiteColor
        ),
        labelColor: kBlackColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14
        ),
        tabs:const [
        Tab(
          text: "🍿Coming Soon",
        ),
        Tab(
          text: "🔥Everyone's watching",
        )
      ]),
    );
  }
}