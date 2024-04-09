// // ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:netflixapp/core/colors/colorss.dart';
// import 'package:netflixapp/core/colors/constants.dart';
// import 'package:netflixapp/presentation/downloads/search/widgets/title.dart';

//  const imageUrl= "https://th.bing.com/th/id/OIP.c3VjSn9aWHYI-JidQavqcgHaK-?w=192&h=285&c=7&r=0&o=5&dpr=1.5&pid=1.7"
//                 "https://th.bing.com/th?id=OIP.mK7G1MgmiqvCz25KXHQa8QHaK-&w=205&h=304&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2" ;

// class SearchWidget extends StatelessWidget {
//    SearchWidget({super.key});
   

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//            const SearchTextTitle(title:'Top Searches'),
//               kHeight,
//               Expanded(
//                 child: ListView.separated(
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) => const TopSearchItemTile(),
//                    separatorBuilder: (context,index)=>kHeight20,
//                     itemCount: 10,
//                     ),
//               ),
//         ],
//       );
//    }
//   }


//   class TopSearchItemTile extends StatelessWidget {
//   const TopSearchItemTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth=MediaQuery.of(context).size.width;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Container(
//           height: 70,
//           width: screenWidth*0.35,
//           decoration:  BoxDecoration(

//             image: DecorationImage(
              
//               fit: BoxFit.cover,
//               image: NetworkImage(imageUrl),),
//           ),
//         ),
//         const Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                  'Movie Name',
//                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                         ),
//             )),
//         const Icon(
//           Icons.play_circle_outline,
//           color: kWhite,
//           size:35,
//           ),
//          ],
//          );
      
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflixapp/core/colors/colorss.dart';
import 'package:netflixapp/core/colors/constants.dart';
import 'package:netflixapp/presentation/downloads/search/widgets/title.dart';


class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  SearchIdleWidgetState createState() => SearchIdleWidgetState();
}

class SearchIdleWidgetState extends State<SearchWidget> {
  List<String> movieNames = [];
  List<String> movieImageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchMovieData();
  }

  Future<void> fetchMovieData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=3f315f48e870f3c2fb683a84f0838274'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> movies = json.decode(response.body)['results'];
        final List<String> names =
            movies.map<String>((movie) => movie['title']).toList();
        final List<String> imageUrls = movies
            .map<String>((movie) =>
                'https://image.tmdb.org/t/p/w500/${movie['poster_path']}')
            .toList();
        setState(() {
          movieNames = names;
          movieImageUrls = imageUrls;
        });
      } else {
        throw Exception('Failed to load movie data');
      }
    } catch (error) {
      Text('Error fetching movie data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const SearchTextTitle(title: 'Top Searches'),
          
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => TopSearchItemTile(
              movieName:
                  movieNames.isNotEmpty ? movieNames[index] : 'Loading...',
              imageUrl: movieImageUrls.isNotEmpty ? movieImageUrls[index] : '',
            ),
            separatorBuilder: (context, index) => kHeight20,
            itemCount: movieNames.length,
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String movieName;
  final String imageUrl;

  const TopSearchItemTile({
    super.key,
    required this.movieName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            movieName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Icon(
          Icons.play_circle_outline,
          color: kWhite,
          size: 35,
        ),
      ],
    );
  }
}