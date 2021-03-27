import 'package:flutter/material.dart';
import 'package:test123/utils/style/designStyle/designStyle.dart';
import 'package:test123/utils/widget/widgetDesign/widgetDesign.dart';
import 'package:test123/views/design/login/exploreLogin.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ScreenStyle.themeDate(),
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: "logo",
                      child: WidgetDesign().logo(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          textColor: Colors.grey),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Enjoy your holiday \n with ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                        children: [
                          TextSpan(
                              text: "travelm",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent[400])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Keep you travell very comfortable, easy and explore the world with travelm.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExploreLogin(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Explore"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
