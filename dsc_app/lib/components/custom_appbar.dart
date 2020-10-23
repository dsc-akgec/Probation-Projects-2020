import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:dsc_app/views/explore_pages/search_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  static Widget leading = Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorPalette.WHITE_COLOR,
    ),
    child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/logo.png'),
      )),
    ),
  );

  static Widget appBar({String title, bool canSearch = false, BuildContext context}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorPalette.SELECTED_NAV_BAR.withOpacity(0.2),
            offset: Offset(0, 2.0),
          )
        ]),
        child: AppBar(
          backgroundColor: ColorPalette.PRIMARY_DARK,
          title: Text(
            title,
            style: TextStyle(color: ColorPalette.SELECTED_NAV_BAR, fontSize: Unit.FONT_LARGE),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          leading: leading,
          actions: <Widget>[
            canSearch
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (_) => SearchBase()));
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
            SizedBox(width: 15),
          ],
          elevation: 0,
          // centerTitle: true,
        ),
      ),
    );
  }

  static Widget appBarwithMenu({String title, BuildContext context, Function func}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorPalette.SELECTED_NAV_BAR.withOpacity(0.2),
            offset: Offset(0, 2.0),
          )
        ]),
        child: AppBar(
          backgroundColor: ColorPalette.PRIMARY_DARK,
          title: Text(
            title,
            style: TextStyle(color: ColorPalette.SELECTED_NAV_BAR, fontSize: Unit.FONT_LARGE),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          leading: leading,
          actions: <Widget>[
            GestureDetector(
              onTap: func,
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
          ],
          elevation: 0,
          // centerTitle: true,
        ),
      ),
    );
  }

  static Widget backOnlyAppBar({BuildContext context}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorPalette.SELECTED_NAV_BAR.withOpacity(0.2),
            offset: Offset(0, 2.0),
          )
        ]),
        child: AppBar(
          backgroundColor: ColorPalette.PRIMARY_DARK,
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          elevation: 0,
          // centerTitle: true,
        ),
      ),
    );
  }

  static Widget searchAppBar({BuildContext context, ValueChanged onSubmit}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorPalette.SELECTED_NAV_BAR.withOpacity(0.2),
            offset: Offset(0, 2.0),
          )
        ]),
        child: AppBar(
          backgroundColor: ColorPalette.PRIMARY_DARK,
          title: TextField(
            onSubmitted: onSubmit,
            style: TextStyle(
              color: ColorPalette.SELECTED_NAV_BAR,
              fontSize: Unit.FONT_LARGE,
            ),
            decoration: InputDecoration(hintText: 'Search User ', hintStyle: TextStyle(color: ColorPalette.SELECTED_NAV_BAR), border: InputBorder.none),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          leading: leading,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
          ],
          elevation: 0,
          // centerTitle: true,
        ),
      ),
    );
  }

  static Widget editAppBar({BuildContext context, String title}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorPalette.SELECTED_NAV_BAR.withOpacity(0.2),
            offset: Offset(0, 2.0),
          )
        ]),
        child: AppBar(
          backgroundColor: ColorPalette.PRIMARY_DARK,
          title: Text(
            title,
            style: TextStyle(color: ColorPalette.SELECTED_NAV_BAR, fontSize: Unit.FONT_LARGE),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          leading: leading,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
          ],
          elevation: 0,
          // centerTitle: true,
        ),
      ),
    );
  }
}
