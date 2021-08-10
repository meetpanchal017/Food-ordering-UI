import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        _buildListItem('Yummy hot dog', 5.0, '6', 'assets/hotdog.png'),
        _buildListItem('Cheesy Pizza', 5.0, '8', 'assets/cheese.png')
      ],
    ));
  }

  _buildListItem(String foodName, rating, String price, String imgPath) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 210,
            child: Row(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Color(0xFFFFE3DF)),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 25.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: GoogleFonts.notoSans(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SmoothStarRating(
                        allowHalfRating: false,
                        onRated: (v) {},
                        starCount: rating.toInt(),
                        rating: rating,
                        color: Color(0xFFFFD143),
                        borderColor: Color(0xFFFFD143),
                        size: 15,
                        spacing: 0.0),
                    Row(
                      children: [
                        Text(
                          "\$" + price,
                          style: GoogleFonts.lato(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(color: Color(0xFFF68D7F))),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          "${price * 2}",
                          style: GoogleFonts.lato(
                              fontSize: 12.0,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.4))),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: foodName,
            mini: true,
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.deepOrange[400],
          ),
        ],
      ),
    );
  }
}
