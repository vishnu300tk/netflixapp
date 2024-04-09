
import 'package:flutter/material.dart';

import 'package:netflixapp/core/colors/constants.dart';
import 'package:netflixapp/bottomavigation.dart';
import 'package:netflixapp/presentation/downloads/search/widgets/searchWidget.dart';




class ScreenSearchPage extends StatelessWidget {
  const ScreenSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
       body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBar(
                
                leading: Icon(Icons.search),
                hintText: "searching.....",
                // trailing: Icon(Icons.cancel),
              ),
              
              kHeight,
              Expanded(child: SearchWidget()),
              // const Expanded(child: SearchResultWidget()),
            ], 
            
          
               ),
        ),
       ),
       bottomNavigationBar: const bottomNavigationWidget(),
    );
    
  }
}
