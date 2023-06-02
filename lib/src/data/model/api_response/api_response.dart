import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse(
      {String? message, int? errorCode, bool? success, T? data}) = _ApiResponse;

  factory ApiResponse.fromJson(
          Map<String, Object?> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
