import 'package:flutter/material.dart';
import 'package:test123/utils/constant/MyColors.dart';
import 'package:test123/utils/style/ScreenStyle.dart';
import 'package:test123/utils/style/TextStyle.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Jun',
      'FAb',
      'FAb',
      'FAb',
      'FAb',
      'FAb',
      'FAb',
      'FAb',
      'FAb',
    ];
    // CalendarController _controller;

    // @override
    // void initState() {
    //   super.initState();
    //   _controller = CalendarController();
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ScreenStyle.themeDate(),
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                for (var item in tabs)
                  Tab(
                    text: "$item",
                  ),
              ],
            ),
            backgroundColor: Colors.transparent,
            title: Text(
              "${DateTime.now()}",
              style: MyTextStyle.textStyle(color: MyColors.colorBlue),
            ),
            leading: Icon(
              Icons.menu_rounded,
              color: MyColors.colorGreyIcon,
            ),
            actions: [
              Icon(
                Icons.settings,
                color: MyColors.colorGreyIcon,
              )
            ],
          ),
          body: TabBarView(
            children: [
              for (var item in tabs) Text(item),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
