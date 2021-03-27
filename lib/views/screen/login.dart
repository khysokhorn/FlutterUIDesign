import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test123/utils/constant/MyColors.dart';
import 'package:test123/utils/constant/Text.dart';
import 'package:test123/utils/style/TextStyle.dart';
import 'package:test123/views/screen/home_screen.dart';
import 'package:test123/views/utils/style/MyTheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  final String title;

  const Login({Key key, this.title}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  User _user;
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final String loginLog = "===============>";

  @override
  void initState() {
    super.initState();
  }

// tow text file
  double buyProduct(int qty, double unitPrice) {
    return qty * unitPrice;
  }

  @override
  Widget build(BuildContext context) {
    final String imagePath = "assets/images/";

    getData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData().lightGreenTheme(),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath + "background.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  // display image on it
                  child: Stack(
                    children: [
                      Positioned(
                        width: 80,
                        left: 30,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                imagePath + "light-1.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 80,
                        left: 140,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                imagePath + "light-2.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 80,
                        height: 150,
                        right: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePath + "clock.png"),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 50,
                          ),
                          child: Center(
                            child: Text(
                              TextConst.login,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              blurRadius: 25.0,
                              offset: Offset(2, 10),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: MyThemeData.inputDecoration(
                                  TextConst.hintEmail,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black.withAlpha(50),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: MyThemeData.inputDecoration(
                                  TextConst.hintPassword,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          buyProduct(12, 10.0);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple[300],
                                Colors.blue[300],
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              TextConst.login,
                              style: MyTextStyle.textStyle(),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          signInWithGoogle().then(
                            (User user) {
                              print(
                                  "$loginLog user name is ${user.displayName}");
                            },
                          ).catchError(
                            (e) {
                              print("$loginLog somthing wrong with $e");
                            },
                          );
                        },
                        child: Image.asset(imagePath + "clock.png"),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget password ?",
                          style: TextStyle(
                            color: MyColors.colorBlue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<User> signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    var result = await _auth.signInWithCredential(authCredential);

    _user = result.user;

    print("user name is ${_user.displayName}");
    print("user name is ${_user.email}");
    print("user name is ${_user.emailVerified}");
    print("user name is ${_user.metadata}");
    print("user name is ${_user.phoneNumber}");
    print("user name is ${_user.photoURL}");
    print("user name is ${_user.uid}");
    print("user name is ${_user.tenantId}");
    print("user name is ${_user.refreshToken}");

    return _user;
  }

  void getData() async {
    await FirebaseFirestore.instance.collection('profile').get().then(
      (q) {
        q.docs.forEach(
          (doc) {
            print(
                "doc profile is ${doc['name']} and image URL is ${doc['imageUrl']}");
          },
        );
      },
    );
  }
}
