import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colorss.dart';


const imageUrl=[
  "https://th.bing.com/th?id=OIP.-6TGwYgfzcuBNWDjjEOpHQHaKs&w=207&h=300&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2",
  "https://th.bing.com/th/id/OIP.UpLShiqXMte7zP8qnivuqgAAAA?w=115&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.nPCLJ5Vz4BeMHVhUb_HoCAHaEK?w=270&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.qQ5NPH30nLY4wpmfIMRXiwHaEo?w=292&h=182&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.weifekWEHQvfaeaxEmceSwHaEo?w=283&h=182&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.VsB4Q5HY9BDHvX8-DCydDQHaFj?w=180&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.LL0ujdPu2mNMUx5hq3ECggHaEU?w=266&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.BJjliAymjrAZJdnXzHD7LQHaE8?w=220&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.xF1kTSnXVV3SmkbzNmPH2QHaI4?w=124&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.pWia9uomictOG0GyvyZdpQHaFj?w=234&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  
];
class VideoListlist extends StatelessWidget {
  final int index;  
  const VideoListlist({super.key,  required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Container(
                     child: Image(
             image: NetworkImage(imageUrl[index]), 
             height: 500,
             width: double.infinity,fit: BoxFit.cover, ),
              
                     color: Colors.accents[index % Colors.accents.length],
                   ),
          ),

           
        
        Positioned(
          bottom: 0,
        left: 0,
        right: 0,
        child :Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            // left side
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                  onPressed: (){},
                   icon: const Icon(Icons.volume_mute),
                   ),
                   ),
            ),
            // right side
             Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: CircleAvatar(
                    radius: 30,
                     backgroundImage: NetworkImage(imageUrl[index]),
                  ),
                ),
                VideoActionWidget(icon: Icons.emoji_emotions, title: 'LoL'),
                 VideoActionWidget(icon: Icons.add,title: 'My List'),
                VideoActionWidget(icon: Icons.share,title: 'share'),
                VideoActionWidget(icon: Icons.play_arrow,title: 'Play',),
                
              ],
            )
          ],
        ),
        ),
      ],
    );
  }
}
class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  
  const VideoActionWidget({
    super.key, 
  required this.icon,
  required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(icon,color: Colors.white,
          size: 30,),
          Text(title,
          style: const 
          TextStyle(
            color: kWhite,
            fontSize: 16),),
        ],
      ),
    );
  }
}