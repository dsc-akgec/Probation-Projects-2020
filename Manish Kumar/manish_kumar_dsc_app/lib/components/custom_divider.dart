import 'package:dsc_app/constants/color_palatte.dart';
import 'package:flutter/material.dart';

class CustomDivider {
  static Widget zeroPaddingDivider() {
    return Divider(
      height: 1,
      thickness: 0,
      color: ColorPalette.SELECTED_NAV_BAR,
    );
  }

  static Widget zeroPaddingDividerGrey() {
    return Divider(
      height: 1,
      thickness: 0,
      color: Colors.grey,
    );
  }
}
