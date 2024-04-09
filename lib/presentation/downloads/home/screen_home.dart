import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colorss.dart';
import 'package:netflixapp/core/colors/constants.dart';
import 'package:netflixapp/bottomavigation.dart';
import 'package:netflixapp/presentation/downloads/home/number_title_card.dart';
import 'package:netflixapp/presentation/downloads/search/widgets/main_title_card.dart';

class ScreenhomePage extends StatelessWidget {
  const ScreenhomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              leading: Image(
                image: NetworkImage(
                    'https://i0.wp.com/elpoderdelasideas.com/wp-content/uploads/netflix-nuevo-logo.png?w=2048&ssl=1'),
                height: 60,
                width: 60,
              ),
              actions: [
                Icon(
                  Icons.cast,
                  color: kWhite,
                ),
                kWidth,
                Image(
                  image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.xicKR1yI9GLL64Tqb-KdKwAAAA?pid=ImgDet&w=192&h=192&c=7&dpr=1.5'),
                  height: 23,
                  width: 23,
                ),
                kWidth
              ],
              
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'TV Shows'),
                  Tab(text: 'Movies'),
                  Tab(text: 'Categories'),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height:500,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://th.bing.com/th/id/OIP.qz_SdYL1d69g1w1MYaC1xQHaK5?w=186&h=274&c=7&r=0&o=5&dpr=1.5&pid=1.7'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              left: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Column(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: kWhite,
                                          size: 25,
                                        ),
                                        Text(
                                          'My List',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    _Playbutton(),
                                    const Column(
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: kWhite,
                                          size: 25,
                                        ),
                                        Text(
                                          'Info',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const MainTitleCard(title: "Released in the past year"),
                        kHeight,
                        const MainTitleCard(title: "Trending Now"),
                        kHeight,
                        const NumberTitleCard(),
                        kHeight,
                        const MainTitleCard(title: "Tense Dramas"),
                        kHeight,
                        const MainTitleCard(title: "South Indian Cinema"),
                        kHeight,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const bottomNavigationWidget(),
      ),
    );
  }

  TextButton _Playbutton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kWhite),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlack,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: kBlack),
        ),
      ),
    );
  }
}
