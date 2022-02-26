import 'package:freezed_annotation/freezed_annotation.dart';
part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    final String? name,
  }) = _LocationState;
}
