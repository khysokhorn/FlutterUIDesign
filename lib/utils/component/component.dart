import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test123/models/pexelsModel/pexelsImageModel.dart';

class Component {
  Widget roundedImge(url, List<Photo> _photos) {
    return Container(
      width: 190,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: FadeInImage(
              fadeInCurve: Curves.bounceIn,
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                "${_photos..map((e) => e.src.medium)}",
                scale: 0.4,
              ),
              placeholderErrorBuilder: (_, object, strack) {
                return Text("$strack");
              },
              matchTextDirection: true,
              imageSemanticLabel: "${_photos..map((e) => e.photographer)}",
              placeholder: AssetImage("assets/images/background.png"),
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${_photos..map((e) => e.photographer)}",
                          style: TextStyle(
                            color: Colors.redAccent[400],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${_photos.map((e) => e.photographer)}",
                          style: TextStyle(
                            color: Colors.redAccent[400],
                          ),
                        ),
                      ],
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
            ),
          ),
        ],
      ),
    );
  }
}
