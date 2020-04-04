import 'package:covidpass/models/store_detail.dart';
import 'package:covidpass/screens/slot_boogking_success.dart';
import 'package:covidpass/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreDetailPage extends StatefulWidget {
  final StoreDetail storeDetail;

  StoreDetailPage(this.storeDetail);

  @override
  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: widget.storeDetail.id,
                  child: Image.asset(
                    widget.storeDetail.imageUrl,
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
                        "24 Mantra Organic",
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
                            "Old Madras Road, Gopalan Grand Mall",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: SecondaryTextColor),
                          ),
                          Text(" . "),
                          Expanded(
                            child: Text(
                              "3.1 km",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: SecondaryTextColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Get Direction",
                          style: TextStyle(
                            fontSize: 12,
                            color: PrimaryColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration:
                BoxDecoration(border: Border.all(color: ItemTableBorderColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Available Items", style: TextStyle(fontSize: 14)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      size: 14,
                      color: PrimaryDarkColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "CALL US TO ENQUIRE",
                      style: TextStyle(
                        fontSize: 12,
                        color: PrimaryDarkColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                border: Border(
              left: BorderSide(color: ItemTableBorderColor),
              right: BorderSide(color: ItemTableBorderColor),
              bottom: BorderSide(color: ItemTableBorderColor),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ...[0, 1, 2, 3, 4, 5, 6, 7, 8]
                        .map((it) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "${String.fromCharCode(0x2022)} ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: SecondaryLightTextColor,
                                    ),
                                  ),
                                  Text(
                                    "Raw Banana",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: SecondaryLightTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList()
                  ],
                ),
                Column(
                  children: <Widget>[
                    ...[0, 1, 2, 3, 4, 5, 6, 7, 8]
                        .map((it) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "${String.fromCharCode(0x2022)} ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: SecondaryLightTextColor,
                                    ),
                                  ),
                                  Text(
                                    "Sunflower Oil",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: SecondaryLightTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList()
                  ],
                ),
                Column(
                  children: <Widget>[
                    ...[0, 1, 2, 3, 4, 5, 6, 7, 8]
                        .map(
                          (it) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "${String.fromCharCode(0x2022)} ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: SecondaryLightTextColor,
                                  ),
                                ),
                                Text(
                                  "Wheat Flour",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: SecondaryLightTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList()
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: TabBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Select Time Slot",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Today, 5 Apr",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 14,
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                                child: Text(
                                  "8.00AM - 9.00AM",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  border:
                                      Border.all(color: ItemTableBorderColor),
                                ),
                                child: Text(
                                  "8.00AM - 9.00AM",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  border:
                                      Border.all(color: ItemTableBorderColor),
                                ),
                                child: Text("8.00AM - 9.00AM"),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  border:
                                      Border.all(color: ItemTableBorderColor),
                                ),
                                child: Text("8.00AM - 9.00AM"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 21, horizontal: 54),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: PrimaryDarkColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SlotBookingSuccess()),
                        );
                      },
                      child: Text(
                        "BOOK SLOT",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
