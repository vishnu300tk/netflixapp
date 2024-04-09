import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixapp/core/colors/constants.dart';
import 'package:netflixapp/presentation/downloads/search/widgets/title.dart';

const imageUrl= "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/e22ff753131197.596c4c560ae3b.jpg";
class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title:" Movie & TV"),
        kHeight,
        Expanded(child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1/1.5,
          children:List.generate(20, (index) {
            return const MainCard();
          },
          ),
          ),
          ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( 
      decoration: BoxDecoration(
        image: const DecorationImage(image: NetworkImage(imageUrl),
        fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}