import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';
part 'api.freezed.dart';

@RestApi(baseUrl: "https://api.quotable.io/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/random")
  Future<Quotes> getRandomQuotes();
}

@freezed
class Quotes with _$Quotes {
  const factory Quotes({
    @JsonKey(name: "_id") required String id,
    required List<String> tags,
    required String content,
    required String author,
    required String authorSlug,
    required int length,
    required DateTime dateAdded,
    required DateTime dateModified,
  }) = _Quotes;

  factory Quotes.fromJson(Map<String, dynamic> json) => _$QuotesFromJson(json);
}
