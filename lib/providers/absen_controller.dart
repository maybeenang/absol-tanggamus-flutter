import 'package:absensitanggamus/constants/api_endpoint.dart';
import 'package:absensitanggamus/entity/history_absen_entity.dart';
import 'package:absensitanggamus/providers/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'absen_controller.g.dart';

@riverpod
class AbsenController extends _$AbsenController {
  late SharedPreferences _sharedPreferences;
  static const _sharedPrefsKey = 'access-token';
  bool isAuth = false;
  final Dio dio = Dio();

  @override
  FutureOr<HistoryAbsen?> build() async {
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
      final user = await getAbsenToday();
      return user;
    } else {
      return null;
    }
  }

  Future<HistoryAbsen?> getAbsenToday() async {
    state = const AsyncValue<HistoryAbsen?>.loading();
    final token = _sharedPreferences.getString(_sharedPrefsKey);
    if (token == null) {
      return null;
    }

    final absenAttemp = await AsyncValue.guard<HistoryAbsen?>(
      () async {
        try {
          final Uri uri = Uri.parse(ApiEndPoint.absenToday);
          final Response response = await dio.get(
            uri.toString(),
            options: Options(
              headers: {"Authorization": "Bearer $token"},
            ),
          );
          final data = response.data;
          final HistoryAbsen absen = HistoryAbsen.fromJson(data);
          return absen;
        } on DioException catch (e) {
          return Future.error(e.response?.data['message'] ?? 'Unknown error');
        } catch (e) {
          return Future.error(e.toString());
        }
      },
    );

    return absenAttemp.when(
      data: (data) => data,
      loading: () => null,
      error: (error, stackTrace) => null,
    );
  }

  Future<String?> absenMasuk() async {
    final token = _sharedPreferences.getString(_sharedPrefsKey);
    if (token == null) {
      state = AsyncValue.error('Token not found', StackTrace.current);
      return null;
    }

    if (state.value!.statusAbsenId != 1) {
      return null;
    }
    state = const AsyncValue.loading();

    try {
      final Uri uri =
          Uri.parse(ApiEndPoint.absenMasuk + state.value!.absenId.toString());
      final Response response = await dio.get(
        uri.toString(),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      state = AsyncValue.data(await getAbsenToday());

      return response.data['message'];
    } on DioException catch (e) {
      state = AsyncValue.data(await getAbsenToday());
      return e.response?.data['message'] ?? 'Unknown error';
    } catch (e) {
      state = AsyncValue.data(await getAbsenToday());
      return e.toString();
    }
  }

  Future<HistoryAbsen?> getHistoryByDate(String date) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final token = sharedPreferences.getString(_sharedPrefsKey);
    if (token == null) {
      state = AsyncValue.error('Token not found', StackTrace.current);
      return null;
    }

    try {
      final Uri uri = Uri.parse(ApiEndPoint.historyAbsen + date.toString());
      final Response response = await dio.get(
        uri.toString(),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      final data = response.data;
      final HistoryAbsen absen = HistoryAbsen.fromJson(data);

      return absen;
    } on DioException catch (e) {
      return Future.error(e.response?.data['message'] ?? 'Unknown error');
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
