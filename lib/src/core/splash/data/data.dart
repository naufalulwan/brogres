import 'package:dartz/dartz.dart' as dz;
import 'package:dio/dio.dart';

import 'package:uuid/uuid.dart';

import '../../../global/constants/url_string.dart';
import '../../../global/global.dart';
import '../domain/entity/info_login/info_login_entity.dart';
import '../domain/entity/token_device/token_device_entity.dart';
import 'dto/info_login/info_login_dto.dart';
import 'dto/token_device/token_device_dto.dart';

part 'datasource/remote/splash_datasource_remote.dart';
part 'datasource/remote/splash_datasource_remote_impl.dart';
part 'datasource/local/splash_datasource_local.dart';
part 'datasource/local/splash_datasource_local_impl.dart';
part 'mapper/token_device_mapper.dart';
part 'repository/splash_repository.dart';
part 'mapper/info_login_mapper.dart';
