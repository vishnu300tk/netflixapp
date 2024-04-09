


import 'package:flutter/material.dart';

import 'package:netflixapp/bottomavigation.dart';



class MainPageAppBar extends StatelessWidget {
   MainPageAppBar({super.key, });
 

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          
          backgroundColor: Colors.black,
          title: const Image(image: NetworkImage('https://th.bing.com/th/id/OIP.YxhROAvuvdNk_FRph291eAAAAA?pid=ImgDet&w=192&h=192&c=7&dpr=1.5'),height:60,width: 60,),
            
           
          
          actions: [
            
            IconButton(
              color: Colors.white,
              onPressed: () {},
              icon:  const Icon(Icons.search),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () {},
              // icon: const Icon(Icons.account_box_outlined),
              icon: const Image(image: NetworkImage('https://th.bing.com/th/id/OIP.xicKR1yI9GLL64Tqb-KdKwAAAA?pid=ImgDet&w=192&h=192&c=7&dpr=1.5'),
              height: 25,
              width: 25,),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'TV Shows',
              ),
              Tab(text: 'Movies',),
              Tab(text: 'categories',),
            ],
            ),
          
        
        ),
         bottomNavigationBar: const bottomNavigationWidget(),
       
            
          ),
       );
         }
         }
