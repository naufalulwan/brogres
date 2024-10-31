import 'package:flutter/material.dart';

import '../utils/color_util.dart';
import '../utils/size_util.dart';

Widget leadingWidget(BuildContext context) {
  return Container(
    height: 1,
    width: SizeUtil.screenWidth(context) * 0.2,
    color: ColorUtil().tertiaryBlack,
  );
}
