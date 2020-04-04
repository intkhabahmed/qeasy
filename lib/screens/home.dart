import 'package:covidpass/enums/store_category.dart';
import 'package:covidpass/models/store_detail.dart';
import 'package:covidpass/screens/shop_detail_page.dart';
import 'package:covidpass/utils/colors.dart';
import 'package:covidpass/widgets/shadow_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StoreCategory _currentCategory = StoreCategory.ALL;
  List<StoreDetail> stores = [
    StoreDetail()
      ..id = "1"
      ..name = "24 Mantra Organic"
      ..address = "Old Madras Road, Gopalan Grand Mall"
      ..distance = "3.1"
      ..imageUrl = "assets/dummy_store.png"
      ..slots = ["8.00 AM - 9.00 AM", "10.00 AM - 11.00 AM"]
      ..storeCategory = StoreCategory.GROCERIES,
    StoreDetail()
      ..id = "2"
      ..name = "More Mega Store"
      ..address = "Old Madras Road, Gopalan Grand Mall"
      ..distance = "2"
      ..imageUrl = "assets/dummy_store_1.png"
      ..slots = ["8.00 AM - 9.00 AM", "10.00 AM - 11.00 AM"]
      ..storeCategory = StoreCategory.GROCERIES,
    StoreDetail()
      ..id = "3"
      ..name = "24x7 Medicals"
      ..address = "Old Madras Road, Gopalan Grand Mall"
      ..distance = "3.1"
      ..imageUrl = "assets/dummy_store.png"
      ..slots = ["8.00 AM - 9.00 AM", "10.00 AM - 11.00 AM"]
      ..storeCategory = StoreCategory.MEDICINES,
    StoreDetail()
      ..id = "4"
      ..name = "Bharat Medicals"
      ..address = "Old Madras Road, Gopalan Grand Mall"
      ..distance = "2"
      ..imageUrl = "assets/dummy_store_1.png"
      ..slots = ["8.00 AM - 9.00 AM", "10.00 AM - 11.00 AM"]
      ..storeCategory = StoreCategory.MEDICINES,
    StoreDetail()
      ..id = "5"
      ..name = "Licious Meats"
      ..address = "Old Madras Road, Gopalan Grand Mall"
      ..distance = "3.1"
      ..imageUrl = "assets/dummy_store.png"
      ..slots = ["8.00 AM - 9.00 AM", "10.00 AM - 11.00 AM"]
      ..storeCategory = StoreCategory.MEAT,
    StoreDetail()
      ..id = "6"
      ..name = "Khan Meats"
      ..address = "Old Madras Road, Gopalan Grand Mall"
      ..distance = "2"
      ..imageUrl = "assets/dummy_store_1.png"
      ..slots = ["8.00 AM - 9.00 AM", "10.00 AM - 11.00 AM"]
      ..storeCategory = StoreCategory.MEAT,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/vectors/location_pin.svg",
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Domlur, Bangalore",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Icon(Icons.search),
              ],
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            color: TabBackgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildTabItem(StoreCategory.ALL),
                _buildTabItem(StoreCategory.GROCERIES),
                _buildTabItem(StoreCategory.MEDICINES),
                _buildTabItem(StoreCategory.MEAT),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Stores around you",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ...stores
                    .where((it) =>
                        it.storeCategory == _currentCategory ||
                        _currentCategory == StoreCategory.ALL)
                    .map((store) => _buildStoreItem(store))
                    .toList()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabItem(StoreCategory category) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentCategory = category;
        });
      },
      child: Container(
        decoration: _currentCategory == category
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: CardShadowColor,
                    blurRadius: 1.5,
                    spreadRadius: 0.5,
                  ),
                ],
              )
            : null,
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          category.toString().split(".")[1],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStoreItem(StoreDetail storeDetail) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoreDetailPage(storeDetail),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: ShadowCard(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: storeDetail.id,
                  child: Image.asset(
                    storeDetail.imageUrl,
                    width: 82,
                    height: 82,
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        storeDetail.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/vectors/ic_store_location.svg",
                            height: 14,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            storeDetail.address,
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: SecondaryTextColor),
                          ),
                          Text(" . "),
                          Expanded(
                            child: Text(
                              storeDetail.distance,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: SecondaryTextColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/vectors/ic_clock.svg",
                            height: 14,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            "Next available time slots",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: SecondaryTextColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 20.0),
                          Text(
                            storeDetail.slots[0],
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            " | ",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            storeDetail.slots[1],
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
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
}
