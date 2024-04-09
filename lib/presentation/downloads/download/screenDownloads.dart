import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:netflixapp/core/colors/colorss.dart';
import 'package:netflixapp/core/colors/constants.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
   @override
  void initState() {
    super.initState();
    fetchMovieImages(); 
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<String>>(
      valueListenable: movieImagesNotifier,
      builder: (context, movieImages, _) {
        return SafeArea(
          child: Scaffold(
            appBar:  AppBar(
              backgroundColor: Colors.black,
              title: const Text('Downloads',
              style: TextStyle(
                color:Colors.white,
                fontSize:25,fontWeight: FontWeight.bold),),
                 actions: [
          
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon:  const Icon(Icons.cast)
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon:const Image(image: NetworkImage('https://th.bing.com/th/id/OIP.xicKR1yI9GLL64Tqb-KdKwAAAA?pid=ImgDet&w=192&h=192&c=7&dpr=1.5'),
            height: 23,
            width: 23,),
          ),
        ],
        ),
            
            body: ListView.separated(
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SmartDownloads();
                } else if (index == 1) {
                  return Section2(movieImages: movieImages);
                } else {
                  return const Section3();
                }
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 25,
              ),
              itemCount: 3,
            ),
          ),
        );
      },
    );
  }
}

class Section2 extends StatelessWidget {
  final List<String> movieImages;

  const Section2({super.key, required this.movieImages});

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 23.5, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          'We\'ll download a personalised selection of movies and shows for you, so there\'s always something to watch on your device',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: kGrey),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.width * 0.4,
                  backgroundColor: kGrey.withOpacity(0.5),
                ),
              ),
              DownloadsImageWidget(
                      imageList: movieImages[9],
                      margin: const EdgeInsets.only(left: 160.0, bottom: 20.0),
                      angle: 15,
                      size: Size(size.width * 0.4, size.width * 0.58),
                    ),
                    DownloadsImageWidget(
                      imageList: movieImages[1],
                      margin: const EdgeInsets.only(right: 160.0, bottom: 20.0),
                      angle: -15,
                      size: Size(size.width * 0.4, size.width * 0.58),
                    ),
                    DownloadsImageWidget(
                      imageList: movieImages[10],
                      margin: const EdgeInsets.only(bottom: 0.0),
                      size: Size(size.width * 0.5, size.width * 0.65),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Set up',
              style: TextStyle(
                color: kWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: MaterialButton(
            color: kWhite,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'See what you can download',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({super.key});

  

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kWidth,
        Text('Smart downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  final double angle;
  final String imageList;
  final EdgeInsets margin;
  final Size size;

  const DownloadsImageWidget({

    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imageList),
              fit: BoxFit.cover,
            ),
            color: kBlack,
          ),
        ),
      ),
    );
  }
}


final ValueNotifier<List<String>> movieImagesNotifier = ValueNotifier([]);

Future<void> fetchMovieImages() async {
  const apiKey = "3f315f48e870f3c2fb683a84f0838274";
  final response = await http.get(
    Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey',
    ),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> results = data['results'];
    final List<String> images = results
        .map<String>((result) =>
            'https://image.tmdb.org/t/p/w500/${result['poster_path']}')
        .toList();
    movieImagesNotifier.value = images;
  } else {
    throw Exception('Failed to load movies');
  }
}
   
