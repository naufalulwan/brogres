import 'package:dartz/dartz.dart' as dz;
import 'package:dio/dio.dart';

import '../../../global/constants/url_string.dart';
import '../../../global/global.dart';
import '../auth_core.dart';

export 'dto/authorization/authorization_dto.dart';
export 'dto/login/login_dto.dart';
export 'dto/user/user_dto.dart';
export 'dto/login_request/login_request_dto.dart';

part 'datasource/auth_datasource.dart';
part 'datasource/auth_datasource_impl.dart';
part 'mapper/login_mapper.dart';
part 'mapper/login_request_mapper.dart';
part 'repository/auth_repository.dart';
