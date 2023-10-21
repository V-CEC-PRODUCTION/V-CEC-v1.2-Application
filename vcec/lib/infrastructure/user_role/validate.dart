import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/failure/auth_failure.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/user/validate_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: ValidateService)
class ValidateRepo implements ValidateService {
  @override
  Future<Either<dynamic, bool>> getValiadte() async {
    try {
      final accesToken = EmailModel.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accesToken',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .post('${baseUrl}users/auth/validate/access/token/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(true);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        return const Left(AuthFailure());
      } else {
        return const Left(MainFailure.clientFailure());
      }
    }
  }
}
