import 'dart:async';

import 'package:dartz/dartz.dart' as dz;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../global/global.dart';
import '../splash_core.dart';
import 'entity/info_login/info_login_entity.dart';
import 'entity/token_device/token_device_entity.dart';

part 'usecase/fetch_token_device_usecase.dart';
part 'usecase/get_first_login_usecase.dart';
part 'usecase/get_token_device_usecase.dart';
part 'usecase/fetch_info_login_usecase.dart';
part 'repository/splash_repository_impl.dart';
