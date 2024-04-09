import 'package:flutter/material.dart';
import 'package:netflixapp/bottomavigation.dart';

import 'package:netflixapp/presentation/downloads/fast_laugh/widgets/video_list_item.dart';

class ScreenFastAndLaugh extends StatelessWidget {
  const ScreenFastAndLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(body:  SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children:List.generate(10, (index) {
            return  VideoListlist(index: index);
          }),
        ),
        ),
        bottomNavigationBar: const bottomNavigationWidget(),
        );
  }
}