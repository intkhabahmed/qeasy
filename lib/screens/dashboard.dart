import 'package:covidpass/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  final int initialIndex;

  Dashboard({this.initialIndex = 0});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex;
  final List<Widget> _children = [];

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
    return MultiProvider(
      providers: [],
      child: WillPopScope(
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
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: PrimaryColor,
              unselectedItemColor: BottomNavItemColor,
              backgroundColor: Colors.white,
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
      icon: SvgPicture.asset(iconPath),
      activeIcon: SvgPicture.asset(
        iconPath,
        color: PrimaryColor,
        height: 24,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
