import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colorss.dart';
 
import 'package:netflixapp/core/colors/constants.dart';
List<String> Topten=[
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMDBCzuef4uE-8l3bIAC9rKFNjECh9icdOZpGgMcE-cQ&s",
"https://m.media-amazon.com/images/M/MV5BNGU2YTdmMWItNjMzZi00OTkxLTk2NzMtYjEyMjhlZTZlOTE3XkEyXkFqcGdeQXVyMTUyNjIwMDEw.V1.jpg",
"https://m.media-amazon.com/images/M/MV5BZTM2NDI0N2UtOTA1OS00ZWUyLTljNjEtMzM4MWEyZDYyM2VkXkEyXkFqcGdeQXVyMjkxNzQ1NDI@.V1.jpg",
"https://m.media-amazon.com/images/M/MV5BNTgwNTgwYjQtYjE0ZS00ZmE0LTg3ZmItODEzOTU2ZmI3ZThlXkEyXkFqcGdeQXVyMjkxNzQ1NDI@.V1_FMjpg_UX1000.jpg",
"https://m.media-amazon.com/images/M/MV5BZThjODVkNjQtMTk3ZC00NTNiLWE3YTMtMmQ0N2VmNTU5N2I5XkEyXkFqcGdeQXVyMTUyNjIwMDEw.V1.jpg",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfpWHEGGTmr0EkR07nYrB1IOlb3KEcJpVCUqBfXZ0ODA&s",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRORymJIuJ77GkxvRv4ChUFSNAnW08wpIB-n5GV3e4xfQ&s",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKSNuXpEOuLFqY6JQEPU_XB7RlvriEQc-Eo_QcsP18WA&s",
"https://m.media-amazon.com/images/M/MV5BMTc1N2E2ZWItOGNiNS00M2ExLTliYjMtZWI0YjE5MTdhY2IzXkEyXkFqcGdeQXVyMjkxNzQ1NDI@.V1.jpg",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKH0svuwcDuCgayZDmBXte65_4cWY8CQiqsk6zEHRjug&s",
];
class NumberCard extends StatelessWidget {
  const NumberCard({super.key,required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 150,
            ),
            Container(
              width: 150,
              height: 250,
              
              decoration: BoxDecoration(
                borderRadius: kRadius20 ,
                image:  DecorationImage(image: NetworkImage(Topten[index],
                ),
                ),
                ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -10,
          child: BorderedText(
            strokeWidth:10.0,
            strokeColor: kWhite,
            child:
             Text("${index+1}",
            style: const TextStyle(
              fontSize: 120,
              color: kBlack,
            decoration: TextDecoration.none,
            decorationColor: Colors.black,
            ),
            ),
          ),
        ),
      ],
    );
  }
}