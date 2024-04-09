
import 'package:flutter/material.dart';
import 'package:netflixapp/presentation/downloads/download/screenDownloads.dart';

import 'package:netflixapp/presentation/downloads/home/screen_home.dart';
import 'package:netflixapp/presentation/downloads/new_and_hot/screenNewandHot.dart';
import 'package:netflixapp/presentation/downloads/search/screenSearch.dart';
import 'package:netflixapp/presentation/downloads/fast_laugh/screenfast_laugh.dart';

// ignore: camel_case_types
class bottomNavigationWidget extends StatelessWidget {
  const bottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      iconSize: 25,
      currentIndex: 0,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedIconTheme:const IconThemeData(
        color: Colors.white
      ),
      unselectedIconTheme:const IconThemeData(
        color: Colors.grey
      ),
      items: [
      BottomNavigationBarItem(
          icon: IconButton(icon: const Icon (Icons.home), onPressed: () { 
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScreenhomePage(),));
           },),
      label: 'Home'),
        
      BottomNavigationBarItem(
        icon: IconButton(icon:const Icon(Icons.collections), onPressed: () { 
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewAndHotScreen(),));
         },
        ),
      label: 'New & Hot'),
      BottomNavigationBarItem(
        icon: IconButton( icon:const Icon(Icons.emoji_emotions), onPressed: () { 
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScreenFastAndLaugh(),));
           },),
      label: 'Fast Laugh'),
      BottomNavigationBarItem(
        icon: IconButton(icon: const Icon (Icons.search), onPressed: () { 
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScreenSearchPage(),));
           },),
      label: 'Search'),
      BottomNavigationBarItem(
        icon:IconButton( icon:  const Icon(Icons.download), onPressed: () { 
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DownloadsScreen(),));
           },),
      label: 'Download'),
      
    
    
    
      ],
    );
  }
}



