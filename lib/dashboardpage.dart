import 'package:emoji_ui/burgerPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'foodtabs.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0, 3.0))
                      ],
                      color: Color(0xFFC6C7FE),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://img.icons8.com/plasticine/2x/user.png"),
                          fit: BoxFit.contain)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Search for",
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w800, fontSize: 27)),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: GoogleFonts.notoSans(
                      fontSize: 14.0,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.5),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem("Hamburger", "assets/burger.png", "14",
                    Colors.orange.shade50, Colors.orange.shade300),
                _buildListItem("Chips", "assets/fries.png", "18",
                    Colors.blue.shade50, Colors.blue.shade300),
                _buildListItem("Donut", "assets/doughnut.png", "21",
                    Colors.green.shade50, Colors.green.shade300),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.notoSans(
                  fontSize: 16, fontWeight: FontWeight.w700),
              unselectedLabelStyle: GoogleFonts.notoSans(
                  fontSize: 12, fontWeight: FontWeight.w500),
              tabs: [
                Tab(
                  child: Text("FEATURED"),
                ),
                Tab(
                  child: Text("COMBO"),
                ),
                Tab(
                  child: Text("FAVOURITES"),
                ),
                Tab(
                  child: Text("RECOMMENDED"),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450,
            child: TabBarView(controller: tabController, children: [
              FoodTab(),
              FoodTab(),
              FoodTab(),
              FoodTab(),
            ]),
          )
        ],
      ),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BurgerPage(
                    heroTag: foodName,
                    foodName: foodName,
                    pricePerItem: price,
                    imgPath: imgPath,
                  )));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: bgColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: foodName,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        imgPath,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  )),
              SizedBox(
                height: 25,
              ),
              Text(
                foodName,
                style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
              ),
              Text(
                '\$' + price,
                style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
