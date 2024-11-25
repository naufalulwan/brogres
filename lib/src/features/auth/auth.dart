import 'package:brogres/src/configs/stored_config.dart';
import 'package:brogres/src/global/utils/string_formatting_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

import '../../configs/locator_config.dart';
import '../../core/auth/auth_core.dart';
import '../../global/global.dart';

export 'auth.dart';

part 'screen/login_screen.dart';
part 'component/login_button_component.dart';
part 'component/login_checkbox_component.dart';
part 'component/login_formfield_component.dart';
part 'component/login_runningtext_component.dart';
part 'controller/auth_controller.dart';
part 'binding/auth_binding.dart';
