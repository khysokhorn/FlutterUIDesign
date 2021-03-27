import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test123/models/indroductionModel.dart';
import 'package:test123/utils/style/designStyle/designStyle.dart';
import 'package:test123/views/design/login/exploreScreen.dart';

final List<IntroductionModel> imgList = [
  IntroductionModel(
      position: 0,
      imageUrl:
          "https://image.freepik.com/free-photo/flat-lay-yellow-luggage-with-copy-space_23-2148786124.jpg",
      title: "Exlore Destinations",
      description:
          "Discover the places for your trip in the world and feel grate."),
  IntroductionModel(
      position: 1,
      imageUrl:
          "https://image.freepik.com/free-vector/flat-travel-background_23-2148050086.jpg",
      title: "Choose a Destination",
      description:
          "Select a place for your trip easily and know the exact cost of tour."),
  IntroductionModel(
      position: 2,
      imageUrl:
          "https://image.freepik.com/free-vector/hand-drawn-suitcase-background_23-2148045433.jpg",
      title: "Fly to Desitination",
      description:
          "Finally, get ready for the tour and go to your desire destination.")
];

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final String log = "Intro======>";

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item.imageUrl,
                          fit: BoxFit.cover, width: 1000.0),
                    ],
                  )),
            ),
          ))
      .toList();
  int _currentIndex = 0;

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ScreenStyle.themeDate(),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            }),
                        carouselController: _carouselController,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Text(
                              "${imgList[_currentIndex].title}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "${imgList[_currentIndex].description}",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = url.position;
                          return Container(
                            width: _currentIndex == index ? 12.0 : 8.0,
                            height: _currentIndex == index ? 12.0 : 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Colors.redAccent[400]
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsetsDirectional.only(bottom: 35),
                        child: FloatingActionButton(
                          onPressed: () {
                            // new screen here
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExploreScreen(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
