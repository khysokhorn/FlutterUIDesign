import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            ("dislay $num"),
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              return itemDiaplay(name: "sok is change", position: i);
            },
          )
        ],
      ),
    );
  }

  Widget itemDiaplay({int position = 0, String name = "sok"}) {
    return Column(
      children: [
        Text("Title "),
        Text("Subtitle "),
      ],
    );
  }
}
