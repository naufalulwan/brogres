import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:uuid/uuid.dart';

import '../../../global/constants/url_string.dart';
import '../../../global/global.dart';
import '../splash_core.dart';

export 'dto/splash_token/splash_token_dto.dart';

part 'datasource/splash_datasource_remote.dart';
part 'datasource/splash_datasource_remote_impl.dart';
part 'mapper/token_splash_mapper.dart';
part 'repository/splash_repository.dart';
