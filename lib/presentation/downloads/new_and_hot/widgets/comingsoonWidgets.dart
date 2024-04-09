import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/core/colors/colorss.dart';
import 'package:netflixapp/core/colors/constants.dart';
import 'package:netflixapp/customButtonWidget.dart';
import 'package:netflixapp/videoWidget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        children: [
          const SizedBox(
            width: 50,
            height: 520,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'FEB',
                  style: TextStyle(fontSize: 16, color: kGrey),
                ),
                Text(
                  '11',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5),
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width - 50,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VideoWidget(),
                kHeight20,
                const Row(
                  children: [
                    const Text('''The Conjuring (2024) - James Wan | Synopsis
                     Characteristics, Moods ...'''),
                    // Image.asset(
                    //   'assets/TallGirl2.png',
                    //   width: 150,
                    //   color: kWhite,
                    // ),
                    Spacer(),
                    CustomButtonWidget(
                        icon: Icons.notifications_none,
                        textSize: 12,
                        title: 'Remind Me'),
                    kWidth,
                    CustomButtonWidget(
                        textSize: 12, icon: Icons.info_outline, title: 'Info'),
                    kWidth,
                  ],
                ),
                kHeight,
                const Text(
                  'Coming on Friday',
                  style: TextStyle(fontSize: 17),
                ),
                kHeight,
                Text(
                  'The Conjuring',
                  style: GoogleFonts.hammersmithOne(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight,
                const Text(
                  'this is the hooror movie',
                  style: TextStyle(color: kGrey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}