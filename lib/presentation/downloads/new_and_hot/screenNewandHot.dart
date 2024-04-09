import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colorss.dart';
import 'package:netflixapp/core/colors/constants.dart';
import 'package:netflixapp/bottomavigation.dart';
import 'package:netflixapp/presentation/downloads/new_and_hot/widgets/comingsoonWidgets.dart';
import 'package:netflixapp/presentation/downloads/new_and_hot/widgets/everyoneWatchingWidget.dart';


class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kBlack,
            title: const Text(
              'New & Hot',
              style: TextStyle(
                  color: kWhite, fontWeight: FontWeight.bold, fontSize: 30),
            ),
            actions: const [
              Icon(
                Icons.cast,
                color: kWhite,
                size: 30,
              ),
              kWidth,
              Icon(
                Icons.account_box_outlined,
                color: kWhite,
                size: 30,
              ),
            ],
            bottom: TabBar(
              labelColor: kBlack,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              dividerColor: kBlack,
              unselectedLabelColor: kWhite,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelPadding: const EdgeInsets.all(14),
              indicator: BoxDecoration(
                color: kWhite,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Text(
                  '🍟 Coming Soon',
                ),
                Text(
                  '👀 Everyone\'s watching',
                ),
              ],
            ),
          ),
          bottomNavigationBar: const bottomNavigationWidget(),
          body: TabBarView(
            children: [
              _buildComingSoon(),
              _buildEeryonesWatching(),
            ],
          )),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEeryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const EveryonesWatchingWidget(),
    );
  }
}