import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'constants/url_string.dart';
import 'global.dart';

export 'utils/custom_router/custom_builder_util.dart';
export 'utils/custom_router/custom_router_util.dart';
export 'utils/custom_router/custom_shell_router_util.dart';
export 'utils/error_handle/error_handle_util.dart';

//$ Widgets
part 'widgets/appbar_widget.dart';
part 'widgets/bottom_extension_widget.dart';
part 'widgets/bottom_navigator_widget.dart';
part 'widgets/button_black_widget.dart';
part 'widgets/button_cart.dart';
part 'widgets/button_next_widget.dart';
part 'widgets/button_orange_widget.dart';
part 'widgets/button_payment.dart';
part 'widgets/leading_widget.dart';
part 'widgets/text_field_widget.dart';
part 'widgets/dialog_util.dart';

//$ Utils
part 'utils/color_util.dart';
part 'utils/decoration_input_util.dart';
part 'utils/shadow_util.dart';
part 'utils/size_util.dart';
part 'utils/print_util.dart';
part 'utils/route_observer_util.dart';
part 'utils/dio_client_util.dart';
part 'utils/usecase_observer_util.dart';
part 'utils/api_response_util.dart';

//$ constants
part 'constants/asset_string.dart';
part 'constants/hardcode_string.dart';
part 'constants/route_string.dart';
part 'constants/store_string.dart';
part 'constants/share_string.dart';
