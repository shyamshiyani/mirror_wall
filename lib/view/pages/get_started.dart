import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  List imageList = [
    "assets/images/Social tree-rafiki.png",
    "assets/images/Social tree-amico.png",
    "assets/images/Online world-bro.png",
  ];

  int activeIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                width: 350,
                child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  itemBuilder: (context, index, realIndex) {
                    return Image.asset(imageList[index]);
                  },
                  options: CarouselOptions(
                    height: 400,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.easeInToLinear,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 900),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                  carouselController: _carouselController,
                ),
              ),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: imageList.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 16,
                  activeDotColor: Colors.grey,
                ),
                onDotClicked: (index) {
                  _carouselController.animateToPage(index);
                },
              ),
              SizedBox(
                height: 12,
              ),
              OutlinedButton(
                  onPressed: () async {
                    SharedPreferences saveData =
                        await SharedPreferences.getInstance();

                    await saveData.setBool('StartedScrrenVistited', true);

                    Navigator.pushNamed(context, '/');
                  },
                  child: Row(
                    children: [Text("Get Started")],
                  ))
            ],
          ),
        ],
      ),
    ));
  }
}
