import 'package:flutter/material.dart';

class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(title,
    style:const TextStyle(
      color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
    
        ),
        );
  }
}