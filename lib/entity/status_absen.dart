import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_absen.freezed.dart';
part 'status_absen.g.dart';

@freezed
class StatusAbsen with _$StatusAbsen {
  const factory StatusAbsen({
    required int id,
    required String keterangan,
  }) = _StatusAbsen;

  factory StatusAbsen.fromJson(Map<String, dynamic> json) =>
      _$StatusAbsenFromJson(json);
}
