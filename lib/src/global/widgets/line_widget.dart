import 'package:flutter/material.dart';

import '../global.dart';

Widget lineWidget(BuildContext context) {
  return Container(
    height: 1,
    width: SizeUtil.screenWidth(context) * 0.2,
    color: ColorHelper.tertiaryBlack,
  );
}
