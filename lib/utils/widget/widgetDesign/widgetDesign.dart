import 'package:flutter/material.dart';

class WidgetDesign {
  Row logo(
          {CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
          MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
          Color textColor = Colors.white}) =>
      Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.redAccent[400],
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Icon(
              Icons.local_airport_sharp,
              size: 45,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "travelm",
            style: TextStyle(
                color: textColor, fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      );
}
