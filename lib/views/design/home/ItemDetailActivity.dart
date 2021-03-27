import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test123/utils/style/designStyle/designStyle.dart';

class ItemDetailActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ScreenStyle.themeDate(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: [
                    Image.network(
                      "https://images.pexels.com/photos/1580625/pexels-photo-1580625.jpeg",
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fitWidth,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back),
                              label: Text(""),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.redAccent[400],
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Title"),
                          Text("Price"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Title"),
                          Text("Price"),
                        ],
                      ),
                      Text("Description"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.lock_clock,
                                      color: Colors.blue[100],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Days")
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Duration",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.lock_clock,
                                      color: Colors.blue[100],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Days")
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Duration",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.lock_clock,
                                      color: Colors.blue[100],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Days")
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Duration",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            style: ButtonStyle(),
                            onPressed: () {},
                            child: Text("120"),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Book now",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
