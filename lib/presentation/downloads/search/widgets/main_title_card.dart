import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/constants.dart';
import 'package:netflixapp/presentation/downloads/search/widgets/main_card.dart';
import 'package:netflixapp/presentation/downloads/search/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  
  const MainTitleCard({
  
    super.key,required this.title
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitle(title: title),
         kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: 
              List.generate(
                10, (index) =>  MainCard(index: index, Past: [Pastyear], last: [south_images], tences: [tence], trend: [Trending],),
                ),
                
                
          ),
        )
       
      ],
    );
  }
}