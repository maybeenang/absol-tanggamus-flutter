import 'package:freezed_annotation/freezed_annotation.dart';

part 'absen_entity.freezed.dart';
part 'absen_entity.g.dart';

@freezed
class Absen with _$Absen {
  const factory Absen({
    required String id,
    required DateTime tanggal,
    required DateTime jamMasuk,
    required DateTime jamKeluar,
    required DateTime jamBatas,
  }) = _Absen;

  factory Absen.fromJson(Map<String, dynamic> json) => _$AbsenFromJson(json);
}
