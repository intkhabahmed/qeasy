import 'package:covidpass/models/merchant.dart';
import 'package:covidpass/models/slot.dart';
import 'package:covidpass/models/slot_book_request.dart';
import 'package:covidpass/provider/merchant_detail_notifier.dart';
import 'package:covidpass/repository/data_repository.dart';
import 'package:covidpass/screens/slot_booking_success.dart';
import 'package:covidpass/utils/code_snippets.dart';
import 'package:covidpass/utils/colors.dart';
import 'package:covidpass/utils/constants.dart';
import 'package:covidpass/utils/date_utils.dart';
import 'package:covidpass/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class StoreDetailPage extends StatefulWidget {
  final Merchant merchant;

  StoreDetailPage(this.merchant);

  @override
  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  Slot _selectedSlot;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MerchantDetailNotifier>(
      create: (context) => MerchantDetailNotifier(
          widget.merchant.merchantId, SharedPrefUtils.get(Constants.USER_ID)),
      child: Consumer<MerchantDetailNotifier>(
        builder: (context, notifier, child) => Scaffold(
          key: _scaffoldKey,
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
                      tag: widget.merchant.merchantId,
                      child: Image.asset(
                        "assets/dummy_store.png",
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
                            widget.merchant.shopName,
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
                                "${widget.merchant.lat}, ${widget.merchant.long}",
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
                decoration: BoxDecoration(
                    border: Border.all(color: ItemTableBorderColor)),
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
                      SizedBox(
                        height: 16,
                      ),
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
                                "${DateUtils.getFormattedDateInWords(DateTime.now())}",
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
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: notifier.isRequestFinished
                              ? notifier.availableSlots != null
                                  ? GridView.count(
                                      childAspectRatio: 3.5,
                                      crossAxisCount: 2,
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        ...notifier.availableSlots.map((slot) =>
                                            _buildSlotItem(notifier, slot)),
                                      ],
                                    )
                                  : Center(
                                      child: Text("No available Slots"),
                                    )
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 21, horizontal: 54),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: PrimaryDarkColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: InkWell(
                          onTap: () => _bookSlot(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "BOOK SLOT",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Visibility(
                                visible: _isSubmitted,
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(CodeSnippets.makeSnackBar(message));
  }

  Widget _buildSlotItem(MerchantDetailNotifier notifier, Slot slot) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedSlot = slot;
        });
      },
      child: Container(
        margin: EdgeInsets.all(8),
        height: 56,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: _selectedSlot == slot ? PrimaryColor : null,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: _selectedSlot == slot
                ? null
                : Border.all(color: ItemTableBorderColor)),
        child: Text(
          "${slot.starttime}:00 - ${slot.endtime}:00",
          style: TextStyle(
            color: _selectedSlot == slot ? Colors.white : PrimaryTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _bookSlot() {
    if (_selectedSlot == null) {
      _showSnackBar("Select a slot");
      return;
    }
    _isSubmitted = true;
    DataRepository.instance
        .bookSlot((SlotBookRequest()
              ..startTime = _selectedSlot.starttime
              ..endTime = _selectedSlot.endtime
              ..bookingDate = _selectedSlot.date
              ..merchantId = widget.merchant.merchantId
              ..userId = SharedPrefUtils.get(Constants.USER_ID))
            .toJson())
        .then((response) {
      if (response.responseCode == "200" && response.hasError == "false") {
        SharedPrefUtils.setInt(
            Constants.BOOKED_SLOT_ID, response.data["slot_id"]);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SlotBookingSuccess(response.data["slot_id"])),
        );
      }
    }).catchError((e) {
      setState(() {
        _isSubmitted = false;
      });
      print(e.message);
    });
  }
}
