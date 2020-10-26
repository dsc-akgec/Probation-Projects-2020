import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:dsc_app/views/home_pages/home_page_loggedout.dart';
import 'package:dsc_app/views/faqs_pages/faqs_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootLoggedOut extends StatefulWidget {
  @override
  _RootLoggedOutState createState() => _RootLoggedOutState();
}

class _RootLoggedOutState extends State<RootLoggedOut> {
  int selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  Widget bottomNavbar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorPalette.PRIMARY_DARK,
      selectedItemColor: ColorPalette.SELECTED_NAV_BAR,
      unselectedItemColor: ColorPalette.UNSELECTED_NAV_BAR,
      selectedFontSize: Unit.FONT_SMALL,
      unselectedFontSize: Unit.FONT_SMALL,
      currentIndex: selectedIndex,
      elevation: 16,
      iconSize: 25,
      onTap: (index) {
        print("index $index");
        setState(() {
          selectedIndex = index;
        });
        _pageController.animateToPage(selectedIndex,
            duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: 'FAQs'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
          _pageController.animateToPage(selectedIndex,
              duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: ColorPalette.PRIMARY_DARK,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            HomePageLoggedOut(),
            FAQsPage(),
          ],
        ),
        bottomNavigationBar: bottomNavbar(),
      ),
    );
  }
}
