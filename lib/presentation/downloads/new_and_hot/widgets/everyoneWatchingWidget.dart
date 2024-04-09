import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colorss.dart';
import 'package:netflixapp/core/colors/constants.dart';
import 'package:netflixapp/customButtonWidget.dart';
import 'package:netflixapp/videoWidget.dart';


class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          Text(
            'Friends',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          Text(
            'This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work,life and love in 1990s Manhattan.',
            style: TextStyle(color: kGrey),
          ),
          kHeight80,
          VideoWidget(),
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(
                icon: Icons.send,
                title: 'Share',
                textSize: 12,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.add,
                title: 'My List',
                textSize: 12,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.play_arrow,
                title: 'Play',
                textSize: 12,
              ),
              kWidth,
            ],
          )
        ],
      ),
    );
  }
}