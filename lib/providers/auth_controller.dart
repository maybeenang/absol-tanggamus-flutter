import 'package:absensitanggamus/constants/api_endpoint.dart';
import 'package:absensitanggamus/entity/auth_entity.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late SharedPreferences _sharedPreferences;
  static const _accessTokenKey = 'access-token';
  static const _refreshTokenKey = 'refresh-token';
  final Dio dio = Dio();

  @override
  Future<Auth> build() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    final token = _sharedPreferences.getString(_refreshTokenKey);

    if (token == null) {
      return const Auth.signOut();
    }

    return _tryLoginWithToken(token);
  }

  Future<Auth> _tryLoginWithToken(String token) async {
    try {
      state = const AsyncValue<Auth>.loading();

      final Uri url = Uri.parse(ApiEndPoint.refresh);

      final Response response = await dio.get(
        url.toString(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      final data = response.data;

      final accessToken = data['accessToken'];

      _sharedPreferences.setString(_accessTokenKey, accessToken);

      return Auth.signIn(
        token: accessToken,
      );
    } on DioException catch (e) {
      return Auth.error(e.response?.data['message'] ?? 'Unknown error');
    } catch (e) {
      return Auth.error(e.toString());
    }
  }

  Future<void> login(String nip, String password) async {
    state = const AsyncValue<Auth>.loading();
    state = await AsyncValue.guard<Auth>(() async {
      try {
        final Uri url = Uri.parse(ApiEndPoint.login);

        final Response response = await dio.post(
          url.toString(),
          data: {
            'nip': nip,
            'password': password,
          },
        );

        final data = response.data;

        final accessToken = data['accessToken'];
        final refreshToken = data['refreshToken'];

        _sharedPreferences.setString(_accessTokenKey, accessToken);
        _sharedPreferences.setString(_refreshTokenKey, refreshToken);

        return Auth.signIn(
          token: accessToken,
        );
      } on DioException catch (e) {
        return Auth.error(e.response?.data['message'] ?? 'Unknown error');
      } catch (e) {
        return Auth.error(e.toString());
      }
    });
  }
}
