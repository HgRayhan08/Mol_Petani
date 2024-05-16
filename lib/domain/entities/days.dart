import 'package:freezed_annotation/freezed_annotation.dart';

part 'days.freezed.dart';
part 'days.g.dart';

@freezed
class Days with _$Days {
  factory Days() = _Days;

  factory Days.fromJson(Map<String, dynamic> json) => _$DaysFromJson(json);
}
