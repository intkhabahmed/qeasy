import 'package:covidpass/screens/home.dart';
import 'package:covidpass/screens/notifications.dart';
import 'package:covidpass/screens/profile.dart';
import 'package:covidpass/screens/qr_code.dart';
import 'package:covidpass/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget {
  final int initialIndex;

  Dashboard({this.initialIndex = 0});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex;
  final List<Widget> _children = [
    Home(),
    QrCode(),
    Notifications(),
    Profile(),
  ];

  @override
  void initState() {
    _currentIndex = widget.initialIndex;
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          onTabTapped(0);
          return false;
        }
        return true;
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: BottomNavigationBar(
              selectedItemColor: BottomNavItemColor,
              unselectedItemColor: BottomNavItemColor,
              backgroundColor: PrimaryDarkColor,
              type: BottomNavigationBarType.fixed,
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                _buildNavigationItem("Home", "assets/vectors/home.svg"),
                _buildNavigationItem("QR Code", "assets/vectors/qr_code.svg"),
                _buildNavigationItem(
                    "Notifications", "assets/vectors/notification.svg"),
                _buildNavigationItem("Profile", "assets/vectors/profile.svg"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildNavigationItem(String title, String iconPath) {
    return BottomNavigationBarItem(
      icon: Column(
        children: <Widget>[
          Container(
            width: 30,
            height: 3,
          ),
          SizedBox(
            height: 8.0,
          ),
          SvgPicture.asset(iconPath),
        ],
      ),
      activeIcon: Column(
        children: <Widget>[
          Container(
            width: 30,
            height: 3,
            color: Colors.white,
          ),
          SizedBox(
            height: 8.0,
          ),
          SvgPicture.asset(
            iconPath,
            color: BottomNavItemColor,
            height: 24,
          ),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
