import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/bloc/pexelBloc/bloc/pexelbloc_bloc.dart';
import 'package:test123/models/pexelsModel/pexelsImageModel.dart';

import 'package:test123/utils/style/designStyle/designStyle.dart';
import 'package:test123/views/design/home/ItemDetailActivity.dart';

// new feature have added
// release our product now
class HomeScreenDesign extends StatefulWidget {
  @override
  _HomeScreenDesignState createState() => _HomeScreenDesignState();
}

class _HomeScreenDesignState extends State<HomeScreenDesign>
    with TickerProviderStateMixin {
  final List<String> places = [
    "All",
    "America",
    "Europe",
    "Asia",
    "Ocenia",
  ];
  TabController _tabController;
  PexelblocBloc _pexelblocBloc = PexelblocBloc();
  @override
  void initState() {
    _pexelblocBloc.add(GetPexelList());
    _tabController = TabController(length: places.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ScreenStyle.themeDate(),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.redAccent[400],
                      ),
                      child: Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discover",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Explore the best places in world!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.all(
                      Radius.circular(35),
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search your trip",
                              contentPadding: EdgeInsets.all(0)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 5, left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: Colors.redAccent[400],
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey[400],
                  labelColor: Colors.redAccent[400],
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: CircleTabIndicator(
                    color: Colors.redAccent[400],
                    radius: 8,
                  ),
                  indicatorPadding: EdgeInsets.only(top: 5),
                  controller: _tabController,
                  tabs: places
                      .map((e) => Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "$e",
                            ),
                          ))
                      .toList(),
                ),
                Container(
                  height: 270,
                  child: BlocProvider(
                    create: (context) => _pexelblocBloc,
                    child: BlocConsumer<PexelblocBloc, PexelblocState>(
                      builder: (context, state) {
                        if (state is PexelInitial) {
                          return Text("result init");
                        } else if (state is PexelLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is PexelLoaded) {
                          print("data is ${state.pexelModel.photos}");
                          List<Photo> _photos = state.pexelModel.photos;
                          _photos
                              .map((e) => print("url ==> ${e.src.medium} \n"));
                          return ListView.builder(
                            itemCount: _photos.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              print("photo url ${_photos[index].src.original}");
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ItemDetailActivity(),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        } else
                          return Text("result ok");
                      },
                      listener: (context, state) {
                        if (state is PexelError) {
                          print("state is error ${state.error}");
                          Scaffold.of(context).showBottomSheet(
                            (context) => SnackBar(
                              content: Text("${state.error}"),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
