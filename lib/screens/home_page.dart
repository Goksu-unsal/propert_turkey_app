import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_turkey_app/data/fake_http.dart';
import 'package:property_turkey_app/models/propety.dart';
import 'package:property_turkey_app/screens/propery_detail_page.dart';
import 'package:property_turkey_app/screens/searching_page.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fakeHttp =
      FakeHttp(); //şimdilik localden fake data okumak için yazılmış class
  Property _property;
  final pageController = PageController();
  final caruoselController = CarouselController();
  List<String> pathList = [
    "assets\\images\\PageView1.JPG",
    "assets\\images\\PageView2.JPG",
    "assets\\images\\PageView3.JPG",
    "assets\\images\\PageView4.JPG"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fakeHttp.getProperty().then((value) {
      setState(() {
        _property = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Property Turkey"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchingPage()));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SearchingPage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      drawer: buildDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SlidableHelloBar(),
              buildRecomendedPropList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets\\images\\logo.png"),
                  fit: BoxFit.scaleDown),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 185, 48, 6),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 1),
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: Color.fromARGB(255, 185, 48, 6),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                            color: Color.fromARGB(255, 185, 48, 6),
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 1),
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: Color.fromARGB(255, 185, 48, 6),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                            color: Color.fromARGB(255, 185, 48, 6),
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 1),
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: Color.fromARGB(255, 185, 48, 6),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                            color: Color.fromARGB(255, 185, 48, 6),
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SlidableHelloBar() {
    return Container(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          CarouselSlider.builder(
            itemCount: pathList.length,
            itemBuilder: (context, index, i) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  pathList[index],
                  fit: BoxFit.fitHeight,
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2),
              autoPlayInterval: Duration(seconds: 10),
              initialPage: 0,
              viewportFraction: 1, //tüm width'e yayması için 1 olmalı
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.width / 2,
            child: RaisedButton(
              child: Text(
                "Enquare Now",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red.shade900,
              onPressed: () async {
                return await urlLauncher.launch("https://api.whatsapp.com/send?phone=905422245531");
              },
              hoverElevation: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget PropertyObject(BuildContext context, Property property) {
    return _property == null
        ? CircularProgressIndicator()
        : Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(style: BorderStyle.solid, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              children: [
                Text(
                  _property.tittle,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                CarouselSlider.builder(
                  itemCount: _property.assetUrls.length,
                  itemBuilder: (context, index, i) {
                    return Image.network(_property.assetUrls[index]);
                  },
                  options: CarouselOptions(viewportFraction: 1),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$ ${_property.price.toString()}",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                Text(_property.overview),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PropertyDetailPage(_property)));
                    },
                    borderSide: BorderSide(
                      color: Colors.red.shade100,
                      width: 1.5,
                    ),
                    child: Text("Details >>"),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                ),
              ],
            ),
          );
  }

  buildRecomendedPropList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Recomended Properties",
              style: TextStyle(fontSize: 16),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              child: Text(
                "View all >>",
                style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                    color: Colors.red.shade900),
              ),
              onPressed: () {},
            )
          ],
        ),
        Container(
          height: 500,
          child: PageView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return PropertyObject(context, _property);
            },
          ),
        ),
        SizedBox(
          height: 200,
        )
      ],
    );
  }
}
