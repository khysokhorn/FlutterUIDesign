import 'package:flutter/material.dart';
import 'package:test123/utils/style/designStyle/designStyle.dart';
import 'package:test123/utils/widget/widgetDesign/widgetDesign.dart';
import 'package:test123/views/design/login/exploreLogin.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ScreenStyle.themeDate(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
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
                Text(
                  "Reset a new Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: 65,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sand Code",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.arrow_forward),
                    )
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExploreLogin(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
