import 'package:absensitanggamus/entity/absen_entity.dart';
import 'package:absensitanggamus/entity/status_absen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_absen_entity.freezed.dart';
part 'history_absen_entity.g.dart';

@freezed
class HistoryAbsen with _$HistoryAbsen {
  const factory HistoryAbsen({
    required String id,
    required String userNip,
    required String absenId,
    required int statusAbsenId,
    DateTime? jamAbsen,
    required Absen absen,
    required StatusAbsen statusAbsen,
  }) = _HistoryAbsen;

  factory HistoryAbsen.fromJson(Map<String, dynamic> json) =>
      _$HistoryAbsenFromJson(json);
}
