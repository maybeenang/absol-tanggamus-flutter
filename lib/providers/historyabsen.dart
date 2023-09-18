import 'package:absensitanggamus/constants/api_endpoint.dart';
import 'package:absensitanggamus/entity/history_absen_entity.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'historyabsen.g.dart';

@riverpod
class HistoryAbsenController extends _$HistoryAbsenController {
  final Dio dio = Dio();
  @override
  FutureOr<HistoryAbsen?> build() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('access-token');
    if (token == null) {
      state = AsyncValue.error('Token not found', StackTrace.current);
      return null;
    }

    try {
      final Uri uri = Uri.parse(ApiEndPoint.historyAbsen +
          DateFormat(
            'yyyy-MM-dd',
          ).format(DateTime.now()).toString());

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

  Future<HistoryAbsen?> getHistoryByDate(String date) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('access-token');
    if (token == null) {
      state = AsyncValue.error('Token not found', StackTrace.current);
      return null;
    }

    state = const AsyncValue.loading();

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

      state = AsyncValue.data(absen);

      return absen;
    } on DioException catch (e) {
      state = AsyncValue.error(e.response?.data['message'], StackTrace.current);

      return Future.error(e.response?.data['message'] ?? 'Unknown error');
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return Future.error(e.toString());
    }
  }
}
