import 'package:absensitanggamus/constants/api_endpoint.dart';
import 'package:absensitanggamus/entity/user_entity.dart';
import 'package:absensitanggamus/providers/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  late SharedPreferences _sharedPreferences;
  static const _sharedPrefsKey = 'access-token';
  bool isAuth = false;
  final Dio dio = Dio();

  @override
  FutureOr<UserEntity?> build() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    isAuth = await ref.watch(
      authControllerProvider.selectAsync(
        (data) => data.map(
          signIn: (value) => true,
          signOut: (value) => false,
          error: (value) => false,
        ),
      ),
    );
    ref.listenSelf(
      (_, __) {
        // One could write more conditional logic for when to call redirection
        if (state.isLoading) return;
      },
    );

    if (isAuth) {
      final user = await getProfile();
      return user;
    } else {
      return null;
    }
  }

  Future<UserEntity?> getProfile() async {
    state = const AsyncValue<UserEntity?>.loading();
    final token = _sharedPreferences.getString(_sharedPrefsKey);
    if (token == null) {
      return null;
    }

    final userAttemp = await AsyncValue.guard<UserEntity?>(
      () async {
        try {
          final Uri uri = Uri.parse(ApiEndPoint.profile);
          final Response response = await dio.get(
            uri.toString(),
            options: Options(
              headers: {"Authorization": "Bearer $token"},
            ),
          );
          final data = response.data["data"];
          final UserEntity user = UserEntity.fromJson(data);
          return user;
        } on DioException catch (e) {
          return Future.error(e.response?.data['message'] ?? 'Unknown error');
        } catch (e) {
          return Future.error(e.toString());
        }
      },
    );

    return userAttemp.when(
      data: (data) => data,
      loading: () => null,
      error: (error, stackTrace) => null,
    );
  }
}
